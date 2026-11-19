#!/usr/bin/env python3
"""Compile the actual JNI polling functions with deterministic NFA failures.

Usage: python3 check_polling_recovery.py /path/to/packages/modules/Nfc
Requires a C++17 compiler; this does not build an Android image.
"""
import os
from pathlib import Path
import subprocess
import sys
import tempfile


def function(source, signature):
    start = source.index(signature)
    opening = source.index("{", start)
    while ";" in source[start:opening]:
        start = source.index(signature, start + len(signature))
        opening = source.index("{", start)
    depth = 1
    end = opening + 1
    while depth:
        depth += (source[end] == "{") - (source[end] == "}")
        end += 1
    return source[start:end]


PREFIX = r'''
#include <cstdint>
#include <iostream>
#include <stdexcept>
#include <string>
#include <vector>
using tNFA_STATUS = int;
using tNFA_TECHNOLOGY_MASK = unsigned;
constexpr int NFA_STATUS_OK=0, NFA_STATUS_FAILED=1, NFA_STATUS_TIMEOUT=2;
constexpr int NCI_VERSION_2_0=0x20, DEFAULT_MAX_POLLING_WAIT_TIME=5000;
constexpr unsigned DEFAULT_TECH_MASK=0xff;
constexpr int NAME_MAX_POLLING_WAIT_TIME=1, NAME_POLLING_TECH_MASK=2;
constexpr int NCI_LISTEN_DH_NFCEE_ENABLE_MASK=1, NCI_POLLING_DH_ENABLE_MASK=2;
constexpr int NCI_POLLING_DH_DISABLE_MASK=0, NCI_PARAM_ID_CON_DISCOVERY_PARAM=3;
constexpr int NCI_PARAM_LEN_CON_DISCOVERY_PARAM=1, NFA_DM_NFCC_TIMEOUT_EVT=4;
struct Log { template<class T> Log& operator<<(const T&) { return *this; } };
#define LOG(level) Log()
template<class... T> std::string StringPrintf(const char*, T...) { return ""; }
bool sIsShuttingDown, sIsRecovering, sIsDisabling, sIsNfaEnabled;
bool sRfEnabled, sPollingEnabled;
int rfLocks, eventLocks, configLocks, recoveries, version;
int acquireAction, waitAction, waitActionAt, waitCount, failCommand;
int checks;
std::vector<std::string> commands;
void expect(bool ok, const char* reason) {
  ++checks;
  if (!ok) throw std::runtime_error(reason);
}
void changeState(int action) {
  switch(action) {
    case 1: sIsRecovering=true; break;
    case 2: sIsDisabling=true; break;
    case 3: sIsShuttingDown=true; break;
    case 4: sIsNfaEnabled=false; break;
  }
}
struct NfcConfig {
  static unsigned getUnsigned(int name, unsigned fallback) {
    return name==NAME_MAX_POLLING_WAIT_TIME ? 1234 : fallback;
  }
};
struct Event {
  bool wait(int timeout) {
    expect(timeout==1234, "configured finite polling timeout not used");
    expect(eventLocks==1, "wait must hold one event guard");
    ++waitCount;
    if(waitCount!=waitActionAt) return true;
    if(waitAction==5) return false;
    changeState(waitAction);
    return true; // recovery signals the event without a successful completion
  }
  bool wait() { throw std::runtime_error("unbounded controller wait"); }
} sNfaEnableDisablePollingEvent, gNfaSetConfigEvent;
struct SyncEventGuard {
  explicit SyncEventGuard(Event&) { ++eventLocks; }
  ~SyncEventGuard() { --eventLocks; }
};
struct Mutex {
  void lock() { ++configLocks; changeState(acquireAction); }
  void unlock() { --configLocks; }
} gMutexConfig;
void nativeNfcTag_acquireRfInterfaceMutexLock() {
  ++rfLocks;
  changeState(acquireAction);
}
void nativeNfcTag_releaseRfInterfaceMutexLock() { --rfLocks; }
int NFC_GetNCIVersion() { return version; }
int command(const char* name) {
  expect(!sIsRecovering && !sIsDisabling && !sIsShuttingDown && sIsNfaEnabled,
         "command sent after recovery/shutdown started");
  commands.emplace_back(name);
  return int(commands.size())==failCommand ? NFA_STATUS_FAILED : NFA_STATUS_OK;
}
int NFA_StartRfDiscovery() { return command("start-rf"); }
int NFA_StopRfDiscovery() { return command("stop-rf"); }
int NFA_EnablePolling(unsigned) { return command("enable-poll"); }
int NFA_DisablePolling() { return command("disable-poll"); }
int NFA_SetConfig(int, int, uint8_t*) { return command("set-config"); }
void nfaDeviceManagementCallback(int event, void*) {
  expect(event==NFA_DM_NFCC_TIMEOUT_EVT, "wrong recovery event");
  expect(rfLocks==0 && eventLocks==0 && configLocks==0,
         "recovery callback invoked with native locks held");
  ++recoveries;
  sIsRecovering=true;
}
static tNFA_STATUS startPolling_rfDiscoveryDisabled(tNFA_TECHNOLOGY_MASK);
static tNFA_STATUS stopPolling_rfDiscoveryDisabled();
void reset() {
  sIsShuttingDown=sIsRecovering=sIsDisabling=false;
  sIsNfaEnabled=true;
  sRfEnabled=sPollingEnabled=true;
  rfLocks=eventLocks=configLocks=recoveries=0;
  acquireAction=waitAction=failCommand=waitCount=0;
  waitActionAt=1;
  version=0x10;
  commands.clear();
}
void unlocked() {
  expect(rfLocks==0 && eventLocks==0 && configLocks==0, "lock leaked");
}
'''

TESTS = r'''
int main() {
 try {
  reset(); waitAction=1;
  startStopPolling(true);
  expect(commands==std::vector<std::string>{"stop-rf"}, "queued polling after recovery woke RF-stop wait");
  expect(sRfEnabled, "aborted RF stop marked complete"); unlocked();
  for(bool enable: {false,true}) {
    reset(); sPollingEnabled=!enable;
    startStopPolling(enable);
    expect(commands==std::vector<std::string>{"stop-rf",enable?"enable-poll":"disable-poll","start-rf"},
           "normal legacy polling command order");
    expect(sRfEnabled && sPollingEnabled==enable && recoveries==0, "normal polling state");
    unlocked();
    // Exact log sequence: RF-stop wait is signalled by recovery, not completion.
    for(int state=1;state<=4;++state) {
      reset(); waitAction=state;
      startStopPolling(enable);
      expect(commands==std::vector<std::string>{"stop-rf"}, "queued command after aborted RF stop");
      expect(sRfEnabled, "aborted RF stop marked complete");
      unlocked();
    }
    // Missing RF-stop response must start recovery and stop the transaction.
    reset(); waitAction=5;
    startStopPolling(enable);
    expect(commands.size()==1 && recoveries==1, "RF-stop timeout did not abort transaction");
    unlocked();
    // The polling command may itself time out or be aborted during its wait.
    for(int state=1;state<=5;++state) {
      reset(); sPollingEnabled=!enable; waitAction=state; waitActionAt=2;
      startStopPolling(enable);
      expect(commands.size()==2, "RF restarted after aborted polling command");
      expect(sPollingEnabled==!enable, "aborted polling marked complete");
      expect(recoveries==(state==5?1:0), "polling timeout recovery count");
      unlocked();
    }
    for(int failed=1;failed<=2;++failed) {
      reset(); failCommand=failed;
      startStopPolling(enable);
      expect(commands.size()==unsigned(failed), "continued after NFA queue failure");
      unlocked();
    }
  }
  for(int state=1;state<=4;++state) {
    // Check entry guards and recovery racing with lock acquisition.
    for(bool beforeLock: {false,true}) {
      reset();
      if(beforeLock) changeState(state); else acquireAction=state;
      startRfDiscovery(false);
      expect(commands.empty(), "RF command during blocked state"); unlocked();
      reset();
      if(beforeLock) changeState(state); else acquireAction=state;
      expect(startPolling_rfDiscoveryDisabled(0)==NFA_STATUS_FAILED, "enable accepted in blocked state");
      expect(commands.empty(), "enable command during blocked state"); unlocked();
      reset();
      if(beforeLock) changeState(state); else acquireAction=state;
      expect(stopPolling_rfDiscoveryDisabled()==NFA_STATUS_FAILED, "disable accepted in blocked state");
      expect(commands.empty(), "disable command during blocked state"); unlocked();
      reset(); version=0x20;
      if(beforeLock) changeState(state); else acquireAction=state;
      startStopPolling(true);
      expect(commands.empty(), "NCI2 command during blocked state"); unlocked();
    }
  }
  for(bool enable: {false,true}) {
    reset(); version=0x20;
    startStopPolling(enable);
    expect(commands==std::vector<std::string>{"set-config"} && recoveries==0, "normal NCI2 polling");
    unlocked();
    reset(); version=0x20; waitAction=5;
    startStopPolling(enable);
    expect(recoveries==1, "NCI2 set-config timeout not recovered"); unlocked();
  }
  std::cout << "PASS: " << checks << " recovery assertions on production JNI functions\n";
  return 0;
 } catch(const std::exception& e) {
  std::cerr << "FAIL: " << e.what() << '\n'; return 1;
 }
}
'''


def main():
    root = Path(sys.argv[1])
    source = (root / "NfcNci/nci/jni/NativeNfcManager.cpp").read_text()
    signatures = [
        "void startRfDiscovery(bool isStart) {",
        "void startStopPolling(bool isStartPolling) {",
        "static tNFA_STATUS startPolling_rfDiscoveryDisabled(\n",
        "static tNFA_STATUS stopPolling_rfDiscoveryDisabled() {",
    ]
    with tempfile.TemporaryDirectory(prefix="nfc-recovery-") as tmp:
        cpp = Path(tmp) / "check.cpp"
        exe = Path(tmp) / ("check.exe" if os.name == "nt" else "check")
        cpp.write_text(PREFIX + "\n".join(function(source, s) for s in signatures) + TESTS)
        subprocess.run([os.environ.get("CXX", "g++"), "-std=c++17", "-Wall", "-Wextra",
                        "-Werror", str(cpp), "-o", str(exe)], check=True)
        subprocess.run([str(exe)], check=True, timeout=20)


if __name__ == "__main__":
    main()

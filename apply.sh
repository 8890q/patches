#!/bin/bash

cd build/make/
git am --signoff < ~/patches/build_make/0001-Ignore-linker-err.patch
cd ../../
cd frameworks/base/
git am --signoff < ~/patches/frameworks_base/0001-Revert-Revert-Treat-process-group-creation-failure-d.patch
git am --signoff < ~/patches/frameworks_base/0002-Ignore-cgroup-creation-errors.patch
git am --signoff < ~/patches/frameworks_base/0003-Revert-CachedAppOptimizer-use-new-cgroup-api-for-fre.patch
git am --signoff < ~/patches/frameworks_base/0003-Revert-CachedAppOptimizer-use-new-cgroup-api-for-fre.patch
git am --signoff < ~/patches/frameworks_base/0005-Revert-CachedAppOptimizer-don-t-hardcode-freezer-pat.patch
git am --signoff < ~/patches/frameworks_base/0006-CachedAppOptimizer-revert-freezer-to-cgroups-v1.patch
cd ../
cd native/
git am --signoff < ~/patches/frameworks_native/0001-renderengine-gles-unconditionally-skip-PostRenderCle.patch
cd ..
cd libs/net/
git am --signoff < ~/patches/frameworks_libs_net/0001-Restore-back-the-behavior-of-isValid-It-is-legal-to-.patch
cd ../../
cd packages/modules/adb
git am --signoff < ~/patches/packages_modules_adb/0001-adb-Bring-back-support-for-legacy-FunctionFS.patch
cd ../
cd Connectivity
git am --signoff < ~/patches/packages_modules_Connectivity/0001-Allow-failing-to-load-bpf-programs-for-BPF-less-devi.patch
git am --signoff < ~/patches/packages_modules_Connectivity/0002-Dont-delete-UID-from-BpfMap-on-BPF-less-kernel.patch
git am --signoff < ~/patches/packages_modules_Connectivity/0003-Make-the-use-of-IBpfMaps-optional.patch
git am --signoff < ~/patches/packages_modules_Connectivity/0004-Bring-back-traffic-indicators-for-legacy-devices.patch
git am --signoff < ~/patches/packages_modules_Connectivity/0005-Revert-verify-clat-related-permissions-during-boot.patch
git am --signoff < ~/patches/packages_modules_Connectivity/0006-Fix-null-pointer-crash-on-bpfless-devicess.patch
cd ../
cd NetworkStack
git am --signoff < ~/patches/packages_modules_NetworkStack/0001-Revert-Save-ip_client_parse_netlink_events_version-f.patch
git am --signoff < ~/patches/packages_modules_NetworkStack/0002-Revert-Enable-parsing-netlink-events-from-kernel-sin.patch
git am --signoff < ~/patches/packages_modules_NetworkStack/0003-TcpSocketTracker-Opt-out-for-TCP-info-parsing-on-leg.patch
cd ../../../
cd system/bpf/
git am --signoff < ~/patches/system_bpf/0001-Support-no-bpf-usecase.patch
git am --signoff < ~/patches/system_bpf/0002-Revert-detect-inability-to-write-to-index-0-of-bpf-m.patch
cd ../
cd core
git am --signoff < ~/patches/system_core/0001-Fix-support-for-devices-without-cgroupv2-support.patch
git am --signoff < ~/patches/system_core/0002-reboot-must-be-fast-on-legacy-too.patch
git am --signoff < ~/patches/system_core/0003-Revert-libprocessgroup-switch-freezer-to-cgroup-v2.patch
cd ../
cd ../netd
git am --signoff < ~/patches/system_netd/0001-Don-t-fail-on-FTP-conntracking-failing.patch
git am --signoff < ~/patches/system_netd/0002-Support-no-bpf-usecase.patch
git am --signoff < ~/patches/system_netd/0003-Don-t-abort-in-case-of-cgroup-bpf-setup-fail-since-s.patch
cd ../
cd security/
git am --signoff < ~/patches/system_security/0001-keystore-hackup.patch
cd ../../

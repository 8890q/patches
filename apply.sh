#!/bin/bash

cd system/netd
git am --signoff < ~/patches/system_netd/0001-Add-back-support-for-non-bpf-trafic-monitoring.patch
cd ../../
cd hardware/libhardware
git am --signoff < ~/patches/hardware_libhardware/0001-keystore-hackup.patch
cd ../../
cd packages/modules/adb
git am --signoff < ~/patches/packages_modules_adb/0001-Bring_back_support_for_legacy_FunctionFS.patch
cd ../../../
cd system/bpf
git am --signoff < ~/patches/system_bpf/0001-Ignore-bpf-errors-for-4.9-kernels.patch
cd ../
cd security
git am --signoff < ~/patches/system_security/0001-keystore-hackup.patch
cd ../
cd bt
git am --signoff < ~/patches/system_bt/0001-Revert-Bluetooth-HFP-Use-WBS-by-default-1-5.patch
cd ../../
cd frameworks/base
git am --signoff < ~/patches/frameworks_base/0001-Some-services-should-just-stfu.patch
cd ../../

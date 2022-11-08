#!/bin/bash

cd frameworks/libs/net
git am --signoff < ~/patches/frameworks_libs_net/0001-Add-support-for-non-bpf-usecase.patch
cd ../../../
cd system/netd
git am --signoff < ~/patches/system_netd/0001-Add-support-for-non-bpf-usecase.patch
cd ../../
cd packages/modules/Connectivity
git am --signoff < ~/patches/packages_modules_Connectivity/0001-Add-support-for-non-bpf-usecase.patch
cd ../
cd NetworkStack
git am --signoff < ~/patches/packages_modules_NetworkStack/0001-Revert-Enable-parsing-netlink-events-from-kernel-sin.patch
cd ../
cd adb
git am --signoff < ~/patches/packages_modules_adb/0001-adb-Bring-back-support-for-legacy-FunctionFS.patch
cd ../../../
cd system/bpf
git am --signoff < ~/patches/system_bpf/0001-Add-support-for-non-bpf-usecase.patch
cd ..
cd security
git am --signoff < ~/patches/system_security/0001-keystore-hackup.patch
cd ../../
cd frameworks/native
git am --signoff < ~/patches/frameworks_native/0001-Disable-gpu-service.patch
cd ../../
cd system/core
git am --signoff < ~/patches/system_core/0001-Revert-init-Treat-failure-to-create-a-process-group-.patch
cd ../../


#!/bin/bash

cd system/netd
git am --signoff < ~/patches/system_netd/0001-Add-back-support-for-non-bpf-trafic-monitoring.patch
cd ../
cd bpf/
git am --signoff < ~/patches/system_bpf/0001-Ignore-bpf-errors-for-4.9-kernels.patch
cd ../../
cd frameworks/base
git am --signoff < ~/patches/frameworks_base/0001-Some-services-should-just-stfu.patch
cd ../../

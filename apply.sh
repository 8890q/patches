#!/bin/bash

cd system/security/
git am --signoff < ~/patches/system_security/0001-keystore-hackup.patch
cd ../
cd libhidl/
git am --signoff < ~/patches/system_libhidl/hidl_rev.patch
cd ../../
cd frameworks/av/
git am --signoff < ~/patches/frameworks_av/clearkey.patch
cd ../../
cd hardware/interfaces
git am --signoff < ~/patches/hardware_interfaces/legacy_wifi_hidl.patch
git am --signoff < ~/patches/hardware_interfaces/wifi_hidl_2.patch
cd ../../

#!/bin/bash

cd frameworks/libs/net
git reset --hard HEAD~1
cd ../../../
cd system/netd
git reset --hard HEAD~1
cd ../../
cd packages/modules/Connectivity
git reset --hard HEAD~1
cd ../
cd NetworkStack
git reset --hard HEAD~1
cd ../
cd adb
git reset --hard HEAD~1
cd ../../../
cd system/bpf
git reset --hard HEAD~1
cd ..
cd security
#git am --signoff < ~/patches/system_security/0001-keystore-hackup.patch
echo 'skipping system/security patch revert'
cd ../../
cd frameworks/native
git reset --hard HEAD~1
cd ../../
cd system/core
git reset --hard HEAD~1
cd ../../


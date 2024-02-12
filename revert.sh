#!/bin/bash

cd build/make/
git reset --hard HEAD~1
cd ../../
cd frameworks/base/
git reset --hard HEAD~6
cd ../
cd native/
echo "skipping frameworks/native"
cd ../
cd libs/net/
git reset --hard HEAD~1
cd ../../
cd packages/modules/adb
git reset --hard HEAD~1
cd ../
cd Connectivity
git reset --hard HEAD~6
cd ../
cd NetworkStack
git reset --hard HEAD~3
cd ../../../
cd system/bpf/
git reset --hard HEAD~2
cd ../
cd core
git reset --hard HEAD~3
cd ../
cd ../netd
git reset --hard HEAD~3
cd ../
cd system/security/
echo "skipping system/security"
cd ../../

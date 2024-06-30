#!/bin/bash

cd system/netd
git reset --hard HEAD~1
cd ../../
cd hardware/libhardware
echo "skipping hardware/libhardware"
cd ../../
cd packages/modules/adb
git reset --hard HEAD~1
cd ../../../
cd system/bpf
git reset --hard HEAD~1
cd ../
cd security
echo "skipping system/security"
cd ../
cd bt
echo "skipping system/bt"
cd ../../
cd frameworks/base
echo "skipping frameworks/base"
cd ../../


#!/bin/bash

cd system/netd
git reset --hard HEAD~1
cd ../../
cd packages/modules/adb
git reset --hard HEAD~1
cd ../../../
cd system/bpf
git reset --hard HEAD~1
cd ../../
cd frameworks/base
git reset --hard HEAD~1
cd ../../
cd bionic
git reset --hard HEAD~1
cd ../

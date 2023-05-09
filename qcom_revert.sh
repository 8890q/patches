#!/bin/bash

cd system/netd
git reset --hard HEAD~1
cd ../
cd bpf
git reset --hard HEAD~1
cd ../../
cd frameworks/base
git reset --hard HEAD~1
cd ../../

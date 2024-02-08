#!/bin/bash

cd system/security/
echo "skipping system/security"
cd ../
cd libhidl/
git reset --hard HEAD~1
cd ../../
cd frameworks/av/
git reset --hard HEAD~1
cd ../../
cd hardware/interfaces
git reset --hard HEAD~2
cd ../../

#!/bin/bash

cd system/security/
echo "skipping system/security"
cd ../
cd libhidl/
git reset --hard HEAD~1
cd ../../

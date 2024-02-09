#!/bin/bash

cd system/security/
git am --signoff < ~/patches/system_security/0001-keystore-hackup.patch
cd ../../

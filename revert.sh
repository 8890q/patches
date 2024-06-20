#!/bin/bash

# Array of directories and corresponding patches
declare -A patches=(
    ["system/netd"]="system_netd"
    ["packages/modules/adb"]="packages_modules_adb"
    ["system/bpf"]="system_bpf"
    ["frameworks/base"]="frameworks_base"
    ["build/make"]="build_make"
    ["frameworks/native"]="frameworks_native"
    ["packages/modules/Connectivity"]="packages_modules_Connectivity"
    ["packages/modules/DnsResolver"]="packages_modules_DnsResolver"
    ["packages/modules/NetworkStack"]="packages_modules_NetworkStack"
    ["system/core"]="system_core"
)

# Base path for the patches
patches_base_path=~/patches

for dir in "${!patches[@]}"; do
    cd $dir || { echo "Directory $dir not found"; exit 1; }

    patch_dir=${patches[$dir]}
    patch_files=($patches_base_path/$patch_dir/*.patch)

    num_patches=${#patch_files[@]}

    if [ $num_patches -gt 0 ]; then
        git reset --hard HEAD~$num_patches
    fi

    cd - > /dev/null
done

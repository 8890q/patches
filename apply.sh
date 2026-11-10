#!/bin/bash
#
# By acroreiser, 2026
#
# Usage:
#  1. clone https://github.com/Ultra-Legacy-Hippeastrum/legacy_support_patches to the root of your LineageOS source tree
#  2. cd to the root of your LineageOS source tree and run './legacy_support_patches/apply.sh'
#
# You may need to 'chmod +x ./legacy_support_patches/apply.sh' if you got permission denial.

apply_patch() {
	WHERE=$1
	WHAT=$2
	TOP_DIR=$PWD

    cd $WHERE

	if [ "$(cat $WHAT | patch --dry-run -Np1 | grep FAILED)" != "" ] || [ "$(cat $WHAT | patch --dry-run -Np1 | grep "patch detected")" != "" ];
	then
		cat $WHAT | patch --dry-run -Np1
        echo "ABORT: failed to apply $WHAT in $WHERE"
		exit 1
	fi

	git am -3 --ignore-whitespace < $WHAT

    cd $TOP_DIR
}

apply_patches_for() {
	WHERE=$1
	TOP_DIR=$PWD

    echo "Patches for $WHERE"

    cd $TOP_DIR/legacy_support_patches/$WHERE

	for file in *.patch; do
    	[ -e "$file" ] || continue

    	if [[ "$file" != 0* ]]; then
    	    echo "Ignoring: $file"
    	    continue
    	fi

    	WHAT=$(realpath $file)
	    cd $TOP_DIR
    	apply_patch $WHERE $WHAT
	    cd $TOP_DIR/legacy_support_patches/$WHERE

	done

    echo "    success"
    echo ""

    cd $TOP_DIR
}

apply_patches_for bionic
apply_patches_for build/make
apply_patches_for build/release
apply_patches_for build/soong
apply_patches_for device/lineage/sepolicy
apply_patches_for frameworks/av
apply_patches_for frameworks/base
apply_patches_for frameworks/hardware/interfaces
apply_patches_for frameworks/native
apply_patches_for hardware/broadcom/wlan
apply_patches_for hardware/interfaces
apply_patches_for hardware/libhardware
apply_patches_for hardware/qcom-caf/common
apply_patches_for hardware/ril
apply_patches_for packages/modules/Connectivity
apply_patches_for system/core
apply_patches_for system/libhidl
apply_patches_for system/libhwbinder
apply_patches_for system/memory/libmeminfo
apply_patches_for system/sepolicy
apply_patches_for system/tools/hidl
apply_patches_for system/tools/mkbootimg
apply_patches_for vendor/lineage

echo "done"

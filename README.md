These patches are required for legacy devices to boot and function properly. 

Usage:

  1. clone current stable LineageOS source code (lineage-23.2)
  2. clone https://github.com/Ultra-Legacy-Hippeastrum/legacy_support_patches to the root of your LineageOS source tree. You must use the same branch as target LineageOS branch (lineage-23.2)
  3. cd to the root of your LineageOS source tree and run 'chmod +x ./legacy_support_patches/apply.sh'
  4. then run './legacy_support_patches/apply.sh'

NOTE: THESE PATCHES DO NOT COVER BPF-LESS DEVICES!
If your kernel BPF level is lower than 5.4 additionally try to apply bpf patches from https://github.com/MisterZtr/LineageOS_gsi/tree/lineage-23.2/patches/trebledroid

Thanks to Lost-Entrepreneur439 for an idea and formatting current patches.
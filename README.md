# LineageOS 20/Android 13 patches for Exynos 8890 support
Just copy them to coresponding folder and git apply them (or git am --signoff < path/to/file.patch)

Patches here are used to make device without bpf boot and work properly (As of now there is no 3.18 eBPF port)

8895 can use system_security patch due to some keystore issues

Simplest way to apply patches is to clone this repo to ~/patches
copy apply.sh script to root of your android source dir and run apply.sh

you can use revert.sh script to build for 8895 devices after compiling 8890 builds which require 
extra patches, this will only leave system/security patch applied

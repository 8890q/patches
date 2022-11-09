# LineageOS 19.1/Android 12.1 patches for Exynos 8890 support
Just copy them to coresponding folder and git apply them (or git am --signoff < path/to/file.patch)

frameworks/base patch is there because some services are too spamy due to bug google introduced in aosp
its not needed at all but you might want to use it (Not device or rom specific at all but some roms already have fix merged)

Patches here are used to make device without bpf boot and work properly (As of now there is no 3.18 eBPF port)

8895 can use system_security patch due to some keystore issues

Simplest way to apply patches is to clone this repo to ~/patches copy apply.sh script to root of your android source dir and run apply.sh

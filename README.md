# LineageOS 21/Android 14 patches for Exynos 8890 support
Just copy them to coresponding folder and git apply them (or git am --signoff < path/to/file.patch)

Patches here are used to make device without bpf boot and work properly (As of now there is no 3.18 eBPF port)

Simplest way to apply patches is to clone this repo to ~/patches
copy apply.sh script to root of your android source dir and run apply.sh

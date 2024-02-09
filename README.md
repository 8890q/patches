# LineageOS 21/Android 14 patches for Exynos 8895 support
Just copy them to coresponding folder and git apply them (or git am --signoff < path/to/file.patch)

Simplest way to apply patches is to clone this repo to ~/patches copy apply.sh script to root of your android source dir and run apply.sh

Patches for bpf less kernel for 8890 will be added here

system/security patch is dealing with broken gk/ks

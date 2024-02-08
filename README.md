# LineageOS 21/Android 14 patches for Exynos 8895 support
Just copy them to coresponding folder and git apply them (or git am --signoff < path/to/file.patch)

Simplest way to apply patches is to clone this repo to ~/patches copy apply.sh script to root of your android source dir and run apply.sh

For now there are only 8895 patches, we can get rid of most of them (switch to aidl clearkey drm, wifi and hacked libhidlbase from older ver)
system security will stay till gk is fully working

these patches will be fully removed and replaced with bpf patches needed for 8890

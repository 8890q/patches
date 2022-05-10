# LineageOS 19.1 patches for Exynos 8890/8895 support
Just copy them to coresponding folder and git apply them (or git am --signoff < path/to/file.patch)

`picks.sh` is generated with [picklistmaker](https://github.com/AndyCGYan/picklistmaker),
those are optional but some of them are needed for functionality like `326385` which is used to bring back legacy FunctionFS

frameworks/base patch is there because some services are too spamy due to bug google introduced in aosp
its not needed at all but you might want to use it (Not device or rom specific at all but some roms already have fix merged)

Patches here are used to make device without bpf boot and work properly (As of now there is no 3.18 eBPF port)
 
8895_specific patches are only needed on 8 series (s8,s8+ and note8) till we get working hwc on it

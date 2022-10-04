# LineageOS 20/Android 13 patches for Exynos 8890 support
Just copy them to coresponding folder and git apply them (or git am --signoff < path/to/file.patch)

Patches here are used to make device without bpf boot and work properly (As of now there is no 3.18 eBPF port)

8895 can use system_security patch due to some keystore issues

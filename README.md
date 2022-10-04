# LineageOS 20/Android 13 patches for Exynos 8890 support
Just copy them to coresponding folder and git apply them (or git am --signoff < path/to/file.patch)

Patches here are used to make device without bpf boot and work properly (As of now there is no 3.18 eBPF port)

8895 can use system_security patch due to some keystore issues

for time being we will also want to pick https://review.lineageos.org/c/LineageOS/android_vendor_lineage/+/340485
and set TARGET_DISABLE_EPPE := true in device.mk as eppe is not ready for pre treble devices
mainly we need vndk_apex_snapshot_package and android.hidl.memory@1.0-impl.vendor added to list like
rild was added in https://review.lineageos.org/c/LineageOS/android_vendor_lineage/+/340324

# LineageOS 19.1 patches for 8890 support
Just copy them to coresponding folder and git apply them (or git am --signoff < path/to/file.patch)

`picks.sh` is generated with [picklistmaker](https://github.com/AndyCGYan/picklistmaker), those are optional but some of them are needed for functionality like `326385` which is used to bring back legacy FunctionFS

A lot of patches will go away once we switch to new AIDL based power hal without lineage extensions and once 3.18 port of bpf is ready (Or 4.4 kernel port, whichever comes first) rest can go too

 
8895_specific patches are only needed on 8 series (s8,s8+ and note8) till we uprev audio hal (fix incall on 5.0) and get working hwc

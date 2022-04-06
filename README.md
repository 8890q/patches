# LineageOS 19.1 patches for 8890 support
Just copy them to coresponding folder and git apply them (or git am --signoff < file.patch)

`picks.sh` is generated with [picklistmaker](https://github.com/AndyCGYan/picklistmaker), those are optional but some of them are needed for functionality like `326385` which is used to bring back legacy FunctionFS

A lot of patches will go away once we switch to new AIDL based power hal without lineage extensions and once 3.18 port of bpf is ready (Or 4.4 kernel port, whichever comes first) rest can go too

`system/security` patch containing a revert is a new one for 12L Part of `CREATION_DATETIME `  call prevention doesnt work for us so keystore ends up having it twice once called by `libkeymaster_helper.so` and once by keystore2, see if we can either shim this, edit `libkeymaster_helper.so` to prevent such calls or ifdef this  

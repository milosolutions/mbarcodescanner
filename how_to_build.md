# How to build QZXing {#how_to_build}

For barcode recognition you should build [QZXing](https://github.com/ftylitak/qzxing) library first.
(current mbarecodescanner is based on qzxing v.3.0(1082c3b9e53b08ed695b7c34b18d6645ea6704dc))

# How to build

1. Export environment variable before running the script: export ANDROID_NDK_TOOLCHAIN_VERSION=4.9.
2. Run script 
```
./scripts/build_barcode_libraries.sh 
```
Example: 
```
*./scripts/build_barcode_libraries.sh -p /ABSOLUTE_PATH_TO_ZXING_SOURCES/ -n QZXing -d ../Desktop -a ../Android -l /opt/Qt5.7.0_android/5.7/gcc_64/bin -m /opt/Qt5.7.0_android/5.7/android_armv7/bin/ -s /opt/android-sdk/ -k /opt/android-ndk*
```
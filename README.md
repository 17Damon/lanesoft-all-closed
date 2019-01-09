### Step 1

download

qt [qt-everywhere](http://download.qt.io/archive/qt/5.11/5.11.2/single/qt-everywhere-src-5.11.2.tar.xz)

linaro [Cross Compiler i686](https://releases.linaro.org/components/toolchain/binaries/latest-7/arm-linux-gnueabi/gcc-linaro-7.3.1-2018.05-i686_arm-linux-gnueabi.tar.xz)  [runtime](https://releases.linaro.org/components/toolchain/binaries/latest-7/arm-linux-gnueabi/runtime-gcc-linaro-7.3.1-2018.05-arm-linux-gnueabi.tar.xz) [sysroot](https://releases.linaro.org/components/toolchain/binaries/latest-7/arm-linux-gnueabi/sysroot-glibc-linaro-2.25-2018.05-arm-linux-gnueabi.tar.xz).

please install on 32bit linux OS.

### Step 2

cd /yourqteverwhere/path/

```
./configure -prefix /shared2/Qt5.11.2 \
 -opensource \
 -release \
 -confirm-license \
 -verbose \
 -platform linux-g++-32 \
 -device arm-generic-g++ \
 -device-option CROSS_COMPILE=/yourqteverwhere/path//arm-linux-gnueabi- \
 -nomake tests \
 -nomake examples \
 -no-compile-examples \
 -sysroot /yourqteverwhere/path/sysroot \
 -shared \
 -qt-zlib \
 -qt-libjpeg \
 -qt-libpng \
 -no-opengl
```

### Step 3

```
qmake your.pro
```

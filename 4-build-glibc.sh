#!/bin/bash

BUILD_DIR=`pwd`/build/glibc

mkdir -p $BUILD_DIR
pushd $BUILD_DIR
../../deps/glibc-$GLIBC_VER/configure \
    --prefix=$BUILD_DIR/../out \
    --with-headers=$BUILD_DIR/../out/include \
    --build=$MACHTYPE \
    --host=aarch64-linux-android \
    --target=aarch64-linux-android \
    --disable-multilib \
    libc_cv_forced_unwind=yes

make install-bootstrap-headers=yes install-headers
make -j$(getconf _NPROCESSORS_ONLN) csu/subdir_lib
# install csu/crt1.o csu/crti.o csu/crtn.o $BUILD_DIR/../out/lib
aarch64-linux-android-gcc -nostdlib -nostartfiles -shared -x c /dev/null -o $BUILD_DIR/../out/lib/libc.so
touch $BUILD_DIR/../out/include/stubs.h
popd

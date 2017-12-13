#!/bin/bash

BUILD_DIR=`pwd`/build/glibc

mkdir -p $BUILD_DIR
pushd $BUILD_DIR
../../deps/glibc/configure \
    --prefix=/data/local/aarch64-linux-android/ \
    --with-headers=/data/local/aarch64-linux-android/include \
    --build=$MACHTYPE \
    --host=aarch64-linux-android \
    --target=aarch64-linux-android \
    --disable-multilib \
    libc_cv_forced_unwind=yes

make install-bootstrap-headers=yes install-headers

make -j$(getconf _NPROCESSORS_ONLN) csu/subdir_lib

install csu/crt1.o csu/crti.o csu/crtn.o /data/local/linux/lib

aarch64-linux-android-gcc -nostdlib -nostartfiles -shared -x c /dev/null -o /data/local/linux/lib/libc.so

touch /data/local/include/stubs.h

popd

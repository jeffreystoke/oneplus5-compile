#!/bin/sh

BUILD_DIR=`pwd`/build/gcc

mkdir -p $BUILD_DIR
pushd $BUILD_DIR
../../deps/gcc-$GCC_VER/configure \
    --prefix=/data/local \
    --with-sysroot=/data/local \
    --libdir=/data/local/lib \
    --target=aarch64-linux-android \
    --program-transform-name='s&^&aarch64-linux-android-&' \
    --disable-multilib \
    --enable-plugins \
    --enable-libgomp \
    --enable-gnu-indirect-function \
    --enable-ld=default \
    --enable-threads=posix \
    --enable-eh-frame-hdr-for-static \
    --enable-graphite=yes \
    --enable-libstdcxx-time=yes \
    --enable-clocale=gnu \
    --enable-libmpx \
    --enable-shared \
    --enable-nls \
    --enable-languages=c,c++ \
    --enable-cloog-backend=isl \
    --enable-initfini-array \
    --enable-gold

make -j$(getconf _NPROCESSORS_ONLN) all-gcc
make install-gcc
popd
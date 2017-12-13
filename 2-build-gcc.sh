#!/bin/bash

BUILD_DIR=`pwd`/build/gcc

mkdir -p $BUILD_DIR
pushd $BUILD_DIR
../../deps/gcc-$GCC_VER/configure \
    --prefix=/data/local \
    --with-sysroot=/data/local \
    --target=aarch64-linux-android \
    --program-transform-name='s&^&aarch64-linux-android-&' \
    --enable-languages=c,c++ \
    --disable-multilib \
    --enable-gold
    # --libdir=/data/local/lib \
    # --enable-plugins \
    # --enable-libgomp \
    # --enable-gnu-indirect-function \
    # --enable-ld=default \
    # --enable-threads=posix \
    # --enable-eh-frame-hdr-for-static \
    # --enable-graphite=yes \
    # --enable-libstdcxx-time=yes \
    # --enable-clocale=gnu \
    # --enable-libmpx \
    # --enable-shared \
    # --enable-nls \
    # --enable-cloog-backend=isl \
    # --enable-initfini-array \

make -j$(getconf _NPROCESSORS_ONLN) all-gcc
make install-gcc
popd

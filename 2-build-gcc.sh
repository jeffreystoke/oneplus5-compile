#!/bin/bash

BUILD_DIR=`pwd`/build/gcc

mkdir -p $BUILD_DIR
pushd $BUILD_DIR
../../deps/gcc/configure \
    --prefix=/data/local \
    --target=aarch64-linux-android \
    --enable-languages=c,c++ \
    --disable-libgomp \
    --enable-plugin \
    --enable-threads \
    --disable-nls \
    --enable-cloog-backend=isl \
    --enable-gold \
    --enable-gnu-indirect-function \
    --enable-graphite=yes \
    --enable-initfini-array \
    --enable-eh-frame-hdr-for-static \
    --disable-multilib

make -j$(getconf _NPROCESSORS_ONLN) all-gcc
make install-gcc
popd

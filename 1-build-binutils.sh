#!/bin/sh

BUILD_DIR=`pwd`/build/binutils

mkdir -p $BUILD_DIR

pushd $BUILD_DIR
../../deps/binutils-$BINUTILS_VER/configure \
    --prefix=$BUILD_DIR/../out \
    --target=aarch64-linux-android \
    --disable-multilib

make -j$(getconf _NPROCESSORS_ONLN)
make install
popd
#!/bin/bash

BUILD_DIR=`pwd`/build/binutils

mkdir -p $BUILD_DIR

pushd $BUILD_DIR
../../deps/binutils-$BINUTILS_VER/configure \
    --prefix=/data/local \
    --target=aarch64-linux \
    --disable-multilib

make -j$(getconf _NPROCESSORS_ONLN)
make install
popd

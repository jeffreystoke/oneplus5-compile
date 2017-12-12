#!/bin/sh

BUILD_DIR=build/glibc

pushd $BUILD_DIR
make -j$(getconf _NPROCESSORS_ONLN)
make install
popd
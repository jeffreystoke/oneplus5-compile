#!/bin/bash

BUILD_DIR=`pwd`/build/gcc

pushd $BUILD_DIR
make -j$(getconf _NPROCESSORS_ONLN) all-target-libgcc
make install-target-libgcc
popd

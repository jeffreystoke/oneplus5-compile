#!/bin/sh

INSTALL_DIR=`pwd`/build/out

mkdir -p $INSTALL_DIR
pushd deps/linux-$KERNEL_VER
make ARCH=arm64 INSTALL_HDR_PATH=$INSTALL_DIR headers_install
popd

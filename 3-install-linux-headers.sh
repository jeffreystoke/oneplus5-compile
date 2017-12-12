#!/bin/bash

INSTALL_DIR=`pwd`/build/out

mkdir -p $INSTALL_DIR
pushd deps/kernel
make ARCH=arm64 INSTALL_HDR_PATH=/usr/local/linux headers_install
popd

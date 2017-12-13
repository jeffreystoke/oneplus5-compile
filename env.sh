#!/bin/bash

GNU_MIRROR=https://mirrors.tuna.tsinghua.edu.cn/gnu
KERNEL_MIRROR=https://mirrors.tuna.tsinghua.edu.cn/kernel
GCC_MIRROR=ftp://gcc.gnu.org/pub

export GCC_VER=7.2.0
export BINUTILS_VER=2.29
export GLIBC_VER=2.26
export MPFR_VER=3.1.6
export GMP_VER=6.1.2
export MPC_VER=1.0.3
export ISL_VER=0.18
export CLOOG_VER=0.18.1

export GCC_URL=$GNU_MIRROR/gcc/gcc-$GCC_VER/gcc-$GCC_VER.tar.gz
export BINUTILS_URL=$GNU_MIRROR/binutils/binutils-$BINUTILS_VER.tar.gz
export GLIBC_URL=$GNU_MIRROR/glibc/glibc-$GLIBC_VER.tar.gz

export MPFR_URL=$GNU_MIRROR/mpfr/mpfr-$MPFR_VER.tar.gz
export GMP_URL=$GNU_MIRROR/gmp/gmp-$GMP_VER.tar.xz
export MPC_URL=$GNU_MIRROR/mpc/mpc-$MPC_VER.tar.gz
export ISL_URL=$GCC_MIRROR/gcc/infrastructure/isl-$ISL_VER.tar.bz2
export CLOOG_URL=$GCC_MIRROR/gcc/infrastructure/cloog-$CLOOG_VER.tar.gz

export SOURCE_URLS="$GCC_URL $BINUTILS_URL $GLIBC_URL \
$MPFR_URL $GMP_URL $MPC_URL $ISL_URL $CLOOG_URL"

export PATH=$PATH:/data/local/bin

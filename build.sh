#!/bin/sh

SCRIPTS="\
0-install-deps.sh 1-build-binutils.sh 2-build-gcc.sh \
3-install-linux-headers.sh 4-build-glibc.sh 5-build-support.sh \
6-build-std-libc.sh 7-build-std-libc++.sh
"

for s in $SCRIPTS; 
do
    chmod +x $s
    ./$s
done

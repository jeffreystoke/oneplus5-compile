#!/bin/bash

download() {
    for f in $SOURCE_URLS; do
        file=$(basename $f)
        if [ ! -f $file ]; then
            echo "Start downloading: $file"
            curl -fSL $f -o $file
        fi
    done
}

decomp() {
    for f in *.tar*; do
        if [ ! -d ${f%-*} ]; then
            echo "Extracting: $f"
            tar xf $f
            mv ${f%.tar*} ${f%-*}
        fi
    done
}

prepare() {
    pushd gcc
    for f in $MPFR_URL $GMP_URL $MPC_URL $ISL_URL $CLOOG_URL; do
        file=$(basename $f)
        dir=${file%-*}
        if [ -d ../$dir ]; then
            ln -s ../$dir $dir
        else
            echo "dependencies not satisfied, run `./0-install-deps.sh`"
            exit 1
        fi
    done
    popd
}

clean_dir() {
    for f in $SOURCE_URLS; do
        file=$(basename $f)
        dir=${file%.tar*}
        if [ -d $dir ]; then
            rm -rf $dir
        fi
    done
}

clean_file() {
    for f in $SOURCE_URLS; do
        file=$(basename $f)
        if [ -f $file ]; then
            rm -rf $file
        fi
    done
}

mkdir -p deps
pushd deps
case $1 in
    download)
        download
	;;
	decomp)
		decomp
	;;
    prepare)
        prepare
    ;;
    clean_dir)
        clean_dir
    ;;
    clean_file)
        clean_file
    ;;
    *)
    download
    decomp
    prepare
    ;;
esac
popd

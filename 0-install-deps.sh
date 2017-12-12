#!/bin/sh

download() {
    mkdir -p deps
    for f in $SOURCE_URLS; do
        file=$(basename $f)
        if [ ! -f $file ]; then
            curl -fsSL $f -o $file
        fi
    done
}

decomp() {
    for f in *.tar*; do
        tar xf $f
    done
}

prepare() {
    GCC_DIR=$(basename $GCC_URL)
    GCC_DIR=${GCC_DIR%.tar*}
    pushd $GCC_DIR
    for f in $MPFR_URL $GMP_URL $MPC_URL $ISL_URL $CLOOG_URL; do
        file=$(basename $f)
        dir=${file%.tar*}
        if [ -d ../$dir ]; then
            ln -s ../$dir ${file%-*.tar*}
        else
            echo "dependencies not satisfied, run `download` and `decomp`"
            exit 1
        fi
    done
    popd
}

clean_dir() {
    for f in $SOURCE_URLS; do
        file=$(basename $f)
        dir=$file%.tar*
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
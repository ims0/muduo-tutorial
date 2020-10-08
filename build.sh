##########################################################
# File Name: build.sh
# Author: ims
##########################################################
#!/bin/bash

set -e
project_name=${1:-http}
CUR_DIR=$(cd `dirname $0`;pwd)
SOURCE_DIR=$CUR_DIR/cmake-submodule
BUILD_DIR=${BUILD_DIR:-$CUR_DIR/build}
OUTDIR_DIR=$CUR_DIR/output
BUILD_TYPE=${BUILD_TYPE:-debug}
INSTALL_DIR=${INSTALL_DIR:-../${BUILD_TYPE}-install-cpp11}
CXX=${CXX:-g++}

if [ ! "$(ls -A $SOURCE_DIR/muduo)" ]; then
    set -x
    git submodule update --init
fi

ln -sf $BUILD_DIR/$BUILD_TYPE-cpp11/compile_commands.json

rm -rf $OUTDIR_DIR
mkdir -p $BUILD_DIR/$BUILD_TYPE-cpp11 $OUTDIR_DIR\
  && cd $BUILD_DIR/$BUILD_TYPE-cpp11 \
  && cmake \
           -DPROJECT_NAME=$project_name \
           -DCMAKE_BUILD_TYPE=$BUILD_TYPE \
           -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
           -DCMAKE_RUNTIME_OUTPUT_DIRECTORY=$OUTDIR_DIR \
           $SOURCE_DIR \
  && make $*

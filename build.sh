##########################################################
# File Name: build.sh
# Author: ims
##########################################################
#!/bin/bash

set -x

SOURCE_DIR=`pwd`/cmake-submodule
BUILD_DIR=${BUILD_DIR:-./build}
BUILD_TYPE=${BUILD_TYPE:-debug}
INSTALL_DIR=${INSTALL_DIR:-../${BUILD_TYPE}-install-cpp11}
CXX=${CXX:-g++}

ln -sf $BUILD_DIR/$BUILD_TYPE-cpp11/compile_commands.json

mkdir -p $BUILD_DIR/$BUILD_TYPE-cpp11 \
  && cd $BUILD_DIR/$BUILD_TYPE-cpp11 \
  && cmake \
           -DCMAKE_BUILD_TYPE=$BUILD_TYPE \
           -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
           $SOURCE_DIR \
  && make $*

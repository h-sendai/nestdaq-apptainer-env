#!/bin/sh

set -e

HOME=/opt/nestdaq
git clone https://github.com/zeromq/libzmq.git
cd libzmq
mkdir build
cmake \
-DCMAKE_INSTALL_PREFIX=$HOME \
-DCMAKE_CXX_STANDARD=17 \
-B ./build \
-S .
cd build
make -j6
make install

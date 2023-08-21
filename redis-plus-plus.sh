#!/bin/sh

set -e

HOME=/opt/nestdaq
git clone https://github.com/sewenew/redis-plus-plus.git
cd redis-plus-plus
mkdir build
cmake \
    -DCMAKE_INSTALL_PREFIX=$HOME \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_PREFIX_PATH=$HOME \
    -DREDIS_PLUS_PLUS_CXX_STANDARD=17 \
    -DREDIS_PLUS_PLUS_BUILD_TEST=OFF \
    -B ./build \
    -S .
cd build
make install

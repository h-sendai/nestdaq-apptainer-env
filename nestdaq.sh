#!/bin/sh

set -e

HOME=/opt/nestdaq
git clone https://github.com/spadi-alliance/nestdaq.git
cd nestdaq
mkdir build
cmake \
    -DCMAKE_INSTALL_PREFIX=$HOME \
    -DCMAKE_PREFIX_PATH=$HOME \
    -B ./build \
    -S .
cd build
make install

#!/bin/sh

set -e

HOME=/opt/nestdaq
git clone https://github.com/FairRootGroup/FairMQ.git
cd FairMQ
git checkout -b v1.4.55 v1.4.55
mkdir build
cmake \
    -DCMAKE_INSTALL_PREFIX=$HOME \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_PREFIX_PATH="$HOME" \
    -B build \
    -S .
cd build
make -j6
make install

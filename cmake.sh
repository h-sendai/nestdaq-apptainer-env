#!/bin/sh

set -e

curl -LO https://github.com/Kitware/CMake/releases/download/v3.25.0/cmake-3.25.0.tar.gz
tar xf cmake-3.25.0.tar.gz
cd cmake-3.25.0
./configure
make
make install

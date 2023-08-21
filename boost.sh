#!/bin/sh

set -e

HOME=/opt/nestdaq
git clone https://github.com/boostorg/boost.git
cd boost
git checkout -b boost-1.80.0 boost-1.80.0
git submodule update --init --recursive
./bootstrap.sh
./b2 install \
link=static,shared \
threading=single,multi \
cxxstd=17 \
variant=release,debug \
--layout=tagged \
-j6 \
--prefix=$HOME

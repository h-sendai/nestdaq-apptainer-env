#!/bin/sh

set -e

HOME=/opt/nestdaq
git clone --recursive https://github.com/RedisTimeSeries/RedisTimeSeries.git
cd RedisTimeSeries
git checkout -b v1.4.9 v1.4.9
# make -j N causes error
make
mkdir -p $HOME/lib
cp bin/linux-x64-release/redistimeseries.so $HOME/lib

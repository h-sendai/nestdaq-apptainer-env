#!/bin/sh

set -e

HOME=/opt/nestdaq

make_home()
{
    mkdir -p $HOME
    mkdir -p $HOME/{bin,etc,lib,lib64,share,src}
}

remove_sources()
{
    rm -fr FairLogger
    rm -fr FairMQ
    rm -fr RedisTimeSeries
    rm -fr boost
    rm -fr cmake-3.25.0
    rm -fr fmt
    rm -fr hiredis
    rm -fr libzmq
    rm -fr nestdaq
    rm -fr redis
    rm -fr redis-plus-plus
    rm -f  cmake-*.tar.gz
}

remove_sources
make_home

./redis.sh
./redis-setup.sh
./RedisTimeSeries.sh
./boost.sh
./cmake.sh
./ZeroMQ.sh
./fmtlib.sh
./FairLogger.sh
./FairMQ.sh
./hiredis.sh
./redis-plus-plus.sh
./nestdaq.sh
./redisinsight.sh
./run-dir.sh

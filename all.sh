#!/bin/sh

HOME=/home/nestdaq
mkdir -p $HOME
mkdir -p $HOME/nestdaq/{bin,etc,lib,lib64,share,src}

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

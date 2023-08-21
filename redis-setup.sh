#!/bin/sh

set -e

HOME=/opt/nestdaq
mkdir -p $HOME/etc
cd redis
cp redis.conf $HOME/etc/
cd $HOME/etc
sed -i.orig -e 's/^daemonize no/daemonize yes/' redis.conf

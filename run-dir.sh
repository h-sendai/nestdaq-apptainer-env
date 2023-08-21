#!/bin/sh

set -e

HOME=/opt/nestdaq

# ソースのコピー
# とりあえずnestdaqソースはコンテナ内にコピーしておく。
cp -r nestdaq $HOME/src
rm -fr FairMQ
git clone https://github.com/FairRootGroup/FairMQ.git
cp -r FairMQ $HOME/src
# ソースのコピー終了

# runディレクトリの作成

mkdir -p $HOME/run
cd $HOME/run

# 初期設定ファイル nestdaq.sh

cat <<EOF > nestdaq.sh
#!/bin/sh
# source /opt/rh/devtoolset-8/enable
export NESTDAQ=\$HOME
export PATH=/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin
export PATH=/opt/rh/devtoolset-8/root/usr/bin:\$PATH
export PATH=\$HOME/.local/bin:\$HOME/bin:\$PATH
export PATH=\$NESTDAQ/bin:\$PATH
EOF

# redis 起動ファイル init.sh

cat <<EOF > init.sh
#!/bin/sh
redis-server \$NESTDAQ/etc/redis.conf --loadmodule \$NESTDAQ/lib/redistimeseries.so
RIHOST=0.0.0.0 redisinsight-linux64 &
daq-webctl >& \$NESTDAQ/log/daq-webctl.log &
EOF
chmod +x ./init.sh
chmod +x ./nestdaq.sh

#task 起動ファイルなどを symbolic link しておく。

NESTDAQ=$HOME
ln -s $NESTDAQ/scripts/*.sh .

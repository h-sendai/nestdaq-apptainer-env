HOME=/home/nestdaq
curl -LO https://downloads.redisinsight.redislabs.com/1.12.0/redisinsight-linux64
chmod +x redisinsight-linux64
mkdir -p $HOME/nestdaq/bin
mv redisinsight-linux64 $HOME/nestdaq/bin

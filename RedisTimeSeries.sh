HOME=/home/nestdaq
git clone --recursive https://github.com/RedisTimeSeries/RedisTimeSeries.git
cd RedisTimeSeries
git checkout -b v1.4.9 v1.4.9
make -j6
mkdir -p $HOME/nestdaq/lib
cp bin/linux-x64-release/redistimeseries.so $HOME/nestdaq/lib
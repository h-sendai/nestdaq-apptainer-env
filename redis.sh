HOME=/home/nestdaq
git clone https://github.com/redis/redis.git
cd redis
git checkout -b 6.0.16 6.0.16
make -j6 PREFIX=$HOME/nestdaq
make PREFIX=$HOME/nestdaq install

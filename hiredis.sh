HOME=/home/nestdaq
git clone https://github.com/redis/hiredis.git
cd hiredis
make PREFIX=$HOME/nestdaq install

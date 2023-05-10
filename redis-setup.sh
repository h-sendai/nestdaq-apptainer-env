HOME=/home/nestdaq
mkdir -p $HOME/nestdaq/etc
cd redis
cp redis.conf $HOME/nestdaq/etc/
cd $HOME/nestdaq/etc
sed -i.orig -e 's/^daemonize no/daemonize yes/' redis.conf

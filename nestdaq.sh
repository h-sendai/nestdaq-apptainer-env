HOME=/home/nestdaq
git clone https://github.com/spadi-alliance/nestdaq.git
cd nestdaq
mkdir build
cmake \
    -DCMAKE_INSTALL_PREFIX=$HOME/nestdaq \
    -DCMAKE_PREFIX_PATH=$HOME/nestdaq \
    -B ./build \
    -S .
cd build
make install

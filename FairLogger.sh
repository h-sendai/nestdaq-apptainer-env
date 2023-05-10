HOME=/home/nestdaq
git clone https://github.com/FairRootGroup/FairLogger.git
cd FairLogger
mkdir build
cmake \
-DCMAKE_INSTALL_PREFIX=$HOME/nestdaq \
-DCMAKE_CXX_STANDARD=17 \
-DUSE_EXTERNAL_FMT=OFF \
-B build \
-S .

cd build
make -j6
make install

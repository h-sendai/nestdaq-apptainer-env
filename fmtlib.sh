HOME=/opt/nestdaq
git clone https://github.com/fmtlib/fmt.git
cd fmt
mkdir build
cmake \
-DCMAKE_INSTALL_PREFIX=$HOME \
-DCMAKE_POSITION_INDEPENDENT_CODE=TRUE \
-DCMAKE_CXX_STANDARD=17 \
-B build \
-S .
cd build
make -j6
make install


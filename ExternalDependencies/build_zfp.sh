#!/bin/bash

echo "Building zfp ... "

git clone https://github.com/LLNL/zfp.git
cd zfp
git checkout 0.5.5
mkdir -p build
mkdir -p install
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=../install \
	-DBUILD_ZFPY=ON -DPYTHON_LIBRARY=$PYTHON_PATH/lib/libpython3.7m.so -DPYTHON_INCLUDE_DIR=$PYTHON_PATH/include/python3.7m/
make -j16
make install
cd ..
cd ..

echo "Building ZFP done!"

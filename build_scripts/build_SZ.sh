#/usr/bin/bash

# SZ
echo "Building SZ ... "

git clone https://github.com/szcompressor/SZ.git
cd SZ
git checkout v2.1.11
mkdir -p build
mkdir -p install
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=../install 

make -j16
make install
cd ..
cd ..

echo "Building SZ done!"

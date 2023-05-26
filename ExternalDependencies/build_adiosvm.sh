#!/bin/bash

echo "Building adiosvm ... "
git clone https://github.com/pnorbert/adiosvm.git

cd adiosvm/Tutorial/gray-scott
mkdir -p build
mkdir -p install
cd build
cmake -DCMAKE_PREFIX_PATH=../install -DCMAKE_BUILD_TYPE=RelWithDebInfo ..
make
cd ../../../../

echo "Building adiosvm done!"

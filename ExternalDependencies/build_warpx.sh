#!/bin/bash

# build it on summit
echo "Building warpx ... "

source summit_warpx.profile

git clone https://github.com/ECP-WarpX/WarpX.git

cd WarpX/

git checkout 22.01
rm -rf build

cmake -S . -B build -DWarpX_DIMS=3 -DWarpX_COMPUTE=CUDA
cmake --build build -j 6


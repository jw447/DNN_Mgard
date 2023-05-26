#!/bin/bash

echo "Building ADIOS2 ... "

git clone https://github.com/ornladios/ADIOS2.git
cd ADIOS2
git checkout v2.8.1
mkdir -p build
mkdir -p install
cd build
cmake .. -DADIOS2_USE_MPI=ON \
	-DADIOS2_USE_BZip2=OFF \
	-DADIOS2_USE_HDF5=OFF \
	-DADIOS2_USE_Python=ON \
	-DADIOS2_USE_Fortran=OFF \
	-DADIOS2_USE_ZFP=OFF \
	-DADIOS2_USE_SZ=OFF \
	-DADIOS2_USE_MGARD=OFF \
	-DADIOS2_BUILD_EXAMPLES=OFF \
	-DBUILD_SHARED_LIBS=ON \
	-DBUILD_TESTING=OFF \
	-DCMAKE_INSTALL_PREFIX=../install 

make -j 16
make install
cd ..
cd ..

echo "Building ADIOS2 done!"

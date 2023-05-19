#!/bin/bash

echo "Building MDF ... "

git clone https://github.com/lxAltria/Multiprecision-data-refactoring.git
cd Multiprecision-data-refactoring
source ./build_script.sh

cd ..
cd ..

echo "Building MDF done!"

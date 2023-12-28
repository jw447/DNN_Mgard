#!/bin/bash

echo "Building MDF ... "

#git clone https://github.com/lxAltria/Multiprecision-data-refactoring.git
git clone git@github.com:jw447/Multiprecision-data-refactoring.git
cd Multiprecision-data-refactoring

git checkout -b jwang a3c1806

source ./build_script.sh

cd ..
cd ..

echo "Building MDF done!"

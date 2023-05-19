#!/bin/bash

export PROJHOME=/gpfs/alpine/proj-shared/csc143/jwang/io_modeling

source evn_scripts/evn.bash.summit

externalDependenciesPath=$PROJHOME/ExternalDependencies

mkdir -p $externalDependenciesPath

cp build_scripts/* $externalDependenciesPath

cd $externalDependenciesPath

source build_SZ.sh

source build_zfp.sh

source build_ADIOS2.sh

source build_MDF.sh

source build_adiosvm.sh

#source build_warpx.sh

echo "Building dependencies done!"

cd ..

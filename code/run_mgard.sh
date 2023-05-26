#!/bin/bash

WARPX_DIR=/gpfs/alpine/proj-shared/csc143/jwang/DNN_Mgard/data/laser_driven_electron_accl_3d_128

data=$WARPX_DIR/openpmd00020_bx.dat
#MGARD_DIR=/gpfs/alpine/proj-shared/csc143/jwang/DNN_Mgard/ExternalDependencies/Multiprecision-data-refactoring
MGARD_DIR=/gpfs/alpine/proj-shared/csc143/jwang/DNN_Mgard/code/Multiprecision-data-refactoring
$MGARD_DIR/build/test/test_refactor      ${data} 2 32 3 128 128 128

#while IFS= read -r line; do
#    $MGARD_DIR/build/test/test_reconstructor ${data} 0 1 86.2 0 $line
#done < c0_gen.txt

#while IFS= read -r line; do
#    $MGARD_DIR/build/test/test_reconstructor ${data} 0 1 86.2 0 $line
#done < c1_gen.txt

while IFS= read -r line; do
    $MGARD_DIR/build/test/test_reconstructor ${data} 0 1 86.2 0 $line
done < c2_gen.txt


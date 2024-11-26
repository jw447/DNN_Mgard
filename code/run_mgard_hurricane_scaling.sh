#!/bin/bash

HURR_DIR=/lustre/orion/csc143/proj-shared/jwang/DNN_Mgard/data/SDRBENCH-Hurricane-ISABEL-100x500x500
MGARD_DIR=/lustre/orion/csc143/proj-shared/jwang/DNN_Mgard/ExternalDependencies/Multiprecision-data-refactoring
data=$HURR_DIR/CLOUDf48.log10.bin.f32
valueRange=10.152030

relerr=(0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 0.01 0.02 0.03 0.04 0.05 0.06 0.07 0.08 0.09 0.001 0.001 0.002 0.003 0.004 0.005 0.006 0.007 0.008 0.009 0.0001 0.0002 0.0003 0.0004 0.0005 0.0006 0.0007 0.0008 0.0009 0.00001 0.00002 0.00003 0.00004 0.00005 0.00006 0.00007 0.00008 0.00009 0.000001 0.000002 0.000003 0.000004 0.000005 0.000006 0.000007 0.000008 0.000009 0.0000001 0.0000002 0.0000003 0.0000004 0.0000005 0.0000006 0.0000007 0.0000008 0.0000009)
for rel in "${relerr[@]}"; do
    abserr=$(echo "scale=15; $valueRange*$rel" | bc -l)
    #echo $abserr
    $MGARD_DIR/build/test/test_reconstructor ${data} 0 1 $abserr  0 5.54 5.54 5.54
    $MGARD_DIR/build/test/test_reconstructor ${data} 0 1 $abserr  0 .1 .1 .1
done

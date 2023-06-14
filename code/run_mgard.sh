#!/bin/bash

WARPX_DIR=/gpfs/alpine/proj-shared/csc143/jwang/DNN_Mgard/data/laser_driven_electron_accl_3d_128
MGARD_DIR=/gpfs/alpine/proj-shared/csc143/jwang/DNN_Mgard/code/Multiprecision-data-refactoring

#ts	300	 var	 Bx	 min	-3.90119952	 max	4.477568575	drange	8.378768095
#ts	300	 var	 Ex	 min	-78360827.01	 max	78360827.01	drange	156721654
#ts	300	 var	 Jx	 min	-3685764269	 max	3685764269	drange	7371528537
#ts	600	 var	 Bx	 min	-2.808162798	 max	2.918123474	drange	5.726286272
#ts	600	 var	 Ex	 min	-53336858.34	 max	53336858.34	drange	106673716.7
#ts	600	 var	 Jx	 min	-2187342209	 max	2187342209	drange	4374684418
#ts	900	 var	 Bx	 min	-2.707606874	 max	3.417507987	drange	6.125114861
#ts	900	 var	 Ex	 min	-35586925.91	 max	35586925.91	drange	71173851.83
#ts	900	 var	 Jx	 min	-1373975762	 max	1373975762	drange	2747951524

#data=$WARPX_DIR/openpmd00300_bx.dat
#$MGARD_DIR/build/test/test_refactor      ${data} 2 32 3 128 128 128
#
#while IFS= read -r line; do
#    $MGARD_DIR/build/test/test_reconstructor ${data} 0 1 0.8 0 $line
#done < c_gen.txt
#echo "=============================================================="
#
#while IFS= read -r line; do
#    $MGARD_DIR/build/test/test_reconstructor ${data} 0 1 0.8 0 $line
#done < c0_gen.txt
#echo "=============================================================="
#
#while IFS= read -r line; do
#    $MGARD_DIR/build/test/test_reconstructor ${data} 0 1 0.8 0 $line
#done < c1_gen.txt
#echo "=============================================================="
#
#while IFS= read -r line; do
#    $MGARD_DIR/build/test/test_reconstructor ${data} 0 1 0.8 0 $line
#done < c2_gen.txt


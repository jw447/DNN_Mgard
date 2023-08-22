#!/bin/bash

source ../evn_scripts/evn.bash.summit
relerr=0.0001

data=$HURR_DIR/CLOUDf48.log10.bin.f32
valueRange=10.152030
abserr=$(echo "scale=15; $valueRange*$relerr" | bc -l)
echo "===== name=$data  ========"
while IFS= read -r line; do
	$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 $abserr  0 $line
done < c_gen_lv4.txt

data=$HURR_DIR/PRECIPf48.log10.bin.f32
valueRange=35.801388
abserr=$(echo "scale=15; $valueRange*$relerr" | bc -l)
echo "===== name=$data  ========"
while IFS= read -r line; do
	$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 $abserr  0 $line
done < c_gen_lv4.txt

data=$HURR_DIR/QGRAUPf48.log10.bin.f32
valueRange=35.765643
abserr=$(echo "scale=15; $valueRange*$relerr" | bc -l)
echo "===== name=$data  ========"
while IFS= read -r line; do
	$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 $abserr  0 $line
done < c_gen_lv4.txt

data=$HURR_DIR/QICEf48.log10.bin.f32
valueRange=18.683064
abserr=$(echo "scale=15; $valueRange*$relerr" | bc -l)
echo "===== name=$data  ========"
while IFS= read -r line; do
	$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 $abserr  0 $line
done < c_gen_lv4.txt


#!/bin/bash

source ../evn_scripts/evn.bash.summit
relerr=0.000001

data=$SCAL_DIR/PRES-98x1200x1200.f32
valueRange=99534.755615
abserr=$(echo "scale=15; $valueRange*$relerr" | bc -l)
echo "===== name=$data  ========"
while IFS= read -r line; do
	$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 $abserr  0 $line
done < c_gen_lv4.txt

data=$SCAL_DIR/QC-98x1200x1200.f32
valueRange=0.003012
abserr=$(echo "scale=15; $valueRange*$relerr" | bc -l)
echo "===== name=$data  ========"
while IFS= read -r line; do
	$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 $abserr  0 $line
done < c_gen_lv4.txt

data=$SCAL_DIR/QG-98x1200x1200.f32
valueRange=0.014881
abserr=$(echo "scale=15; $valueRange*$relerr" | bc -l)
echo "===== name=$data  ========"
while IFS= read -r line; do
	$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 $abserr  0 $line
done < c_gen_lv4.txt

data=$SCAL_DIR/QI-98x1200x1200.f32
valueRange=0.001601
abserr=$(echo "scale=15; $valueRange*$relerr" | bc -l)
echo "===== name=$data  ========"
while IFS= read -r line; do
	$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 $abserr  0 $line
done < c_gen_lv4.txt

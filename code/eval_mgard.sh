#!/bin/bash

source ../evn_scripts/evn.bash.summit
relerr=0.000001

data=$NYX_DIR/baryon_density.f32
valueRange=115862.231066
abserr=$(echo "scale=15; $valueRange*$relerr" | bc -l)
echo "===== name=$data  ========"
while IFS= read -r line; do
	$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 $abserr  0 $line
done < c_gen_lv4.txt

#data=$NYX_DIR/dark_matter_density.f32
#valueRange=13778.934570
#abserr=$(echo "scale=15; $valueRange*$relerr" | bc -l)
#echo "===== name=$data  ========"
#while IFS= read -r line; do
#	$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 $abserr  0 $line
#done < c_gen_lv4.txt
#
#data=$NYX_DIR/temperature.f32
#valueRange=4780302.524170
#abserr=$(echo "scale=15; $valueRange*$relerr" | bc -l)
#echo "===== name=$data  ========"
#while IFS= read -r line; do
#	$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 $abserr  0 $line
#done < c_gen_lv4.txt
#
#data=$NYX_DIR/velocity_x.f32
#valueRange=82283642.000000
#abserr=$(echo "scale=15; $valueRange*$relerr" | bc -l)
#echo "===== name=$data  ========"
#while IFS= read -r line; do
#	$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 $abserr  0 $line
#done < c_gen_lv4.txt

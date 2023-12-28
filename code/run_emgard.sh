#!/bin/bash

#source ../evn_scripts/evn.bash.summit
source ../evn_scripts/evn.bash.andes
relerr=0.00001

data=$SCAL_DIR/PRES-98x1200x1200.f32
valueRange=99534.755615
abserr=$(echo "scale=15; $valueRange*$relerr" | bc -l)
echo "===== name=$data  ========"
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 $abserr  0 0.242 0.202 0.280 

data=$SCAL_DIR/QC-98x1200x1200.f32
valueRange=0.003012
abserr=$(echo "scale=15; $valueRange*$relerr" | bc -l)
echo "===== name=$data  ========"
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 $abserr  0 0.242 0.202 0.280 

data=$SCAL_DIR/QG-98x1200x1200.f32
valueRange=0.014881
abserr=$(echo "scale=15; $valueRange*$relerr" | bc -l)
echo "===== name=$data  ========"
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 $abserr  0 0.242 0.202 0.280 

data=$SCAL_DIR/QI-98x1200x1200.f32
valueRange=0.001601
abserr=$(echo "scale=15; $valueRange*$relerr" | bc -l)
echo "===== name=$data  ========"
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 $abserr  0 0.242 0.202 0.280 

data=$HURR_DIR/CLOUDf48.log10.bin.f32
valueRange=10.152030
abserr=$(echo "scale=15; $valueRange*$relerr" | bc -l)
echo "===== name=$data  ========"
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 $abserr  0 0.242 0.202 0.280 

data=$HURR_DIR/PRECIPf48.log10.bin.f32
valueRange=35.801388
abserr=$(echo "scale=15; $valueRange*$relerr" | bc -l)
echo "===== name=$data  ========"
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 $abserr  0 0.242 0.202 0.280 

data=$HURR_DIR/QGRAUPf48.log10.bin.f32
valueRange=35.765643
abserr=$(echo "scale=15; $valueRange*$relerr" | bc -l)
echo "===== name=$data  ========"
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 $abserr  0 0.242 0.202 0.280 

data=$HURR_DIR/QICEf48.log10.bin.f32
valueRange=18.683064
abserr=$(echo "scale=15; $valueRange*$relerr" | bc -l)
echo "===== name=$data  ========"
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 $abserr  0 0.242 0.202 0.280 

data=$NYX_DIR/baryon_density.f32
valueRange=115862.231066
abserr=$(echo "scale=15; $valueRange*$relerr" | bc -l)
echo "===== name=$data  ========"
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 $abserr  0 0.242 0.202 0.280 

data=$NYX_DIR/dark_matter_density.f32
valueRange=13778.934570
abserr=$(echo "scale=15; $valueRange*$relerr" | bc -l)
echo "===== name=$data  ========"
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 $abserr  0 0.242 0.202 0.280 

data=$NYX_DIR/temperature.f32
valueRange=4780302.524170
abserr=$(echo "scale=15; $valueRange*$relerr" | bc -l)
echo "===== name=$data  ========"
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 $abserr  0 0.242 0.202 0.280 

data=$NYX_DIR/velocity_x.f32
valueRange=82283642.000000
abserr=$(echo "scale=15; $valueRange*$relerr" | bc -l)
echo "===== name=$data  ========"
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 $abserr  0 0.242 0.202 0.280 

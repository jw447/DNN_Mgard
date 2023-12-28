#!/bin/bash

#source ../evn_scripts/evn.bash.summit
source ../evn_scripts/evn.bash.andes

###### hurricane
data=$HURR_DIR/CLOUDf48.log10.bin.f32 
$MGARD_DIR/build/test/test_refactor      ${data} 2 32 3 500 500 100  

data=$HURR_DIR/PRECIPf48.log10.bin.f32
$MGARD_DIR/build/test/test_refactor      ${data} 2 32 3 500 500 100

data=$HURR_DIR/QGRAUPf48.log10.bin.f32   
$MGARD_DIR/build/test/test_refactor      ${data} 2 32 3 500 500 100

data=$HURR_DIR/QICEf48.log10.bin.f32 
$MGARD_DIR/build/test/test_refactor      ${data} 2 32 3 500 500 100
################
############ nyx
data=$NYX_DIR/baryon_density.f32 
$MGARD_DIR/build/test/test_refactor      ${data} 2 32 3 512 512 512

data=$NYX_DIR/dark_matter_density.f32 
$MGARD_DIR/build/test/test_refactor      ${data} 2 32 3 512 512 512

data=$NYX_DIR/temperature.f32
$MGARD_DIR/build/test/test_refactor      ${data} 2 32 3 512 512 512

data=$NYX_DIR/velocity_x.f32 
$MGARD_DIR/build/test/test_refactor      ${data} 2 32 3 512 512 512
################
########## scale
data=$SCAL_DIR/PRES-98x1200x1200.f32
$MGARD_DIR/build/test/test_refactor      ${data} 2 32 3 1200 1200 98

data=$SCAL_DIR/QC-98x1200x1200.f32
$MGARD_DIR/build/test/test_refactor      ${data} 2 32 3 1200 1200 98

data=$SCAL_DIR/QG-98x1200x1200.f32
$MGARD_DIR/build/test/test_refactor      ${data} 2 32 3 1200 1200 98

data=$SCAL_DIR/QI-98x1200x1200.f32
$MGARD_DIR/build/test/test_refactor      ${data} 2 32 3 1200 1200 98
################



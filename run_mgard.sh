#!/bin/bash

MGARD_DIR=/gpfs/alpine/proj-shared/csc143/jwang/io_modeling/ExternalDependencies/Multiprecision-data-refactoring
WARPX_DIR=/gpfs/alpine/proj-shared/csc143/jwang/io_modeling/data/warpx

echo "ts = 10"
data=$WARPX_DIR/openpmd01000_bx.dat
$MGARD_DIR/build/test/test_refactor      ${data} 4 32 3 512 512 512 
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 62454.357 0 
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 52454.357 0 
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 42454.357 0 
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 32454.357 0 
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 22454.357 0 
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 12454.357 0 
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 6245.4357 0  
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 5245.4357 0  
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 4245.4357 0  
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 3245.4357 0  
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 2245.4357 0  
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 1245.4357 0  
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 624.54357 0  
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 524.54357 0  
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 424.54357 0  
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 324.54357 0  
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 224.54357 0  
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 124.54357 0  
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 62.454357 0  
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 52.454357 0  
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 42.454357 0  
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 32.454357 0  
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 22.454357 0  
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 12.454357 0  
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 6.2454357 0  
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 5.2454357 0  
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 4.2454357 0  
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 3.2454357 0  
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 2.2454357 0  
$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 1.2454357 0  

#echo "ts = 32"
#data=$WARPX_DIR/openpmd03200_bx.dat
#$MGARD_DIR/build/test/test_refactor      ${data} 4 32 3 512 512 512 
#$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 39612.019 0 
#$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 3961.2019 0  
#$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 396.12019 0  
#$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 39.612019 0  
#$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 3.9612019 0  

#echo "ts = 64"
#data=$WARPX_DIR/openpmd06400_bx.dat
#$MGARD_DIR/build/test/test_refactor      ${data} 4 32 3 512 512 512 
#$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 13548.273 0 
#$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 1354.8273 0  
#$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 135.48273 0  
#$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 13.548273 0  
#$MGARD_DIR/build/test/test_reconstructor ${data} 0 1 1.3548273 0  

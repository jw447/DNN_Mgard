#!/bin/bash
#SBATCH -A CSC143
#SBATCH -J mgard_test_gs1_f
#SBATCH -N 1
#SBATCH -t 30:00:00
#SBATCH -o mgard_test_gs1_f_U.o
#SBATCH -e mgard_test_gs1_f_U.e
#SBATCH \-\-mem=0

# andes
module load cmake/3.18.4
module load gcc/9.3.0
module load cuda/10.2.89
module load openmpi/4.0.4

echo "======================"
date

srun -N 1 --ntasks-per-node 1 hostname

#MGARD
MGARD_DIR=/gpfs/alpine/proj-shared/csc143/jwang/io_modeling/Multiprecision-data-refactoring

#DATA_DIR_NYX=/gpfs/alpine/proj-shared/csc143/jwang/io_modeling/data/SDRBENCH-EXASKY-NYX-512x512x512
DATA_DIR_GS=/gpfs/alpine/proj-shared/csc143/jwang/io_modeling/adiosvm/Tutorial/gray-scott

#data range
#NYX.baryon_density: 115862
#gs.U: 1
#gs.V: 1

nx=512
ny=512
nz=512

for sim in 1
do
	for var in "U" "V"
	do
		for fstep in {1..1024}
		do
			data=${DATA_DIR_GS}/gs${sim}raw_f/gs${sim}.bp.${fstep}.${var}.dat
			echo ${data}
			srun -N 1 --ntasks-per-node 1 $MGARD_DIR/build/test/test_refactor      ${data} 4 32 3 ${nx} ${ny} ${nz}

			srun -N 1 --ntasks-per-node 1 $MGARD_DIR/build/test/test_reconstructor ${data} 0 1 9E-2 0
			srun -N 1 --ntasks-per-node 1 $MGARD_DIR/build/test/test_reconstructor ${data} 0 1 8E-2 0
			srun -N 1 --ntasks-per-node 1 $MGARD_DIR/build/test/test_reconstructor ${data} 0 1 7E-2 0
			srun -N 1 --ntasks-per-node 1 $MGARD_DIR/build/test/test_reconstructor ${data} 0 1 6E-2 0
			srun -N 1 --ntasks-per-node 1 $MGARD_DIR/build/test/test_reconstructor ${data} 0 1 5E-2 0
			srun -N 1 --ntasks-per-node 1 $MGARD_DIR/build/test/test_reconstructor ${data} 0 1 4E-2 0
			srun -N 1 --ntasks-per-node 1 $MGARD_DIR/build/test/test_reconstructor ${data} 0 1 3E-2 0
			srun -N 1 --ntasks-per-node 1 $MGARD_DIR/build/test/test_reconstructor ${data} 0 1 2E-2 0
			srun -N 1 --ntasks-per-node 1 $MGARD_DIR/build/test/test_reconstructor ${data} 0 1 1E-2 0
			srun -N 1 --ntasks-per-node 1 $MGARD_DIR/build/test/test_reconstructor ${data} 0 1 9E-4 0
			srun -N 1 --ntasks-per-node 1 $MGARD_DIR/build/test/test_reconstructor ${data} 0 1 8E-4 0
			srun -N 1 --ntasks-per-node 1 $MGARD_DIR/build/test/test_reconstructor ${data} 0 1 7E-4 0
			srun -N 1 --ntasks-per-node 1 $MGARD_DIR/build/test/test_reconstructor ${data} 0 1 6E-4 0
			srun -N 1 --ntasks-per-node 1 $MGARD_DIR/build/test/test_reconstructor ${data} 0 1 5E-4 0
			srun -N 1 --ntasks-per-node 1 $MGARD_DIR/build/test/test_reconstructor ${data} 0 1 4E-4 0
			srun -N 1 --ntasks-per-node 1 $MGARD_DIR/build/test/test_reconstructor ${data} 0 1 3E-4 0
			srun -N 1 --ntasks-per-node 1 $MGARD_DIR/build/test/test_reconstructor ${data} 0 1 2E-4 0
			srun -N 1 --ntasks-per-node 1 $MGARD_DIR/build/test/test_reconstructor ${data} 0 1 1E-4 0
			srun -N 1 --ntasks-per-node 1 $MGARD_DIR/build/test/test_reconstructor ${data} 0 1 9E-6 0
			srun -N 1 --ntasks-per-node 1 $MGARD_DIR/build/test/test_reconstructor ${data} 0 1 8E-6 0
			srun -N 1 --ntasks-per-node 1 $MGARD_DIR/build/test/test_reconstructor ${data} 0 1 7E-6 0
			srun -N 1 --ntasks-per-node 1 $MGARD_DIR/build/test/test_reconstructor ${data} 0 1 6E-6 0
			srun -N 1 --ntasks-per-node 1 $MGARD_DIR/build/test/test_reconstructor ${data} 0 1 5E-6 0
			srun -N 1 --ntasks-per-node 1 $MGARD_DIR/build/test/test_reconstructor ${data} 0 1 4E-6 0
			srun -N 1 --ntasks-per-node 1 $MGARD_DIR/build/test/test_reconstructor ${data} 0 1 3E-6 0
			srun -N 1 --ntasks-per-node 1 $MGARD_DIR/build/test/test_reconstructor ${data} 0 1 2E-6 0
			srun -N 1 --ntasks-per-node 1 $MGARD_DIR/build/test/test_reconstructor ${data} 0 1 1E-6 0
		done
	done
done

#for dname in "baryon_density" #"temperature" "dark_matter_density" "velocity_x" "velocity_y" "velocity_z"  
#do
#	data=${dname}.f32
#	echo ${data}
#	srun -N 1 --ntasks-per-node 1 $MGARD_DIR/build/test/test_refactor      ${DATA_DIR}/${data} 4 32 3 ${nx} ${ny} ${nz}
#	srun -N 1 --ntasks-per-node 1 $MGARD_DIR/build/test/test_reconstructor ${DATA_DIR}/${data} 0 1 11586.2     0
#	srun -N 1 --ntasks-per-node 1 $MGARD_DIR/build/test/test_reconstructor ${DATA_DIR}/${data} 0 1 1158.62     0
#	srun -N 1 --ntasks-per-node 1 $MGARD_DIR/build/test/test_reconstructor ${DATA_DIR}/${data} 0 1 115.862     0
#	srun -N 1 --ntasks-per-node 1 $MGARD_DIR/build/test/test_reconstructor ${DATA_DIR}/${data} 0 1 11.5862     0
#	srun -N 1 --ntasks-per-node 1 $MGARD_DIR/build/test/test_reconstructor ${DATA_DIR}/${data} 0 1 1.15682     0
#	srun -N 1 --ntasks-per-node 1 $MGARD_DIR/build/test/test_reconstructor ${DATA_DIR}/${data} 0 1 0.115862    0
#	srun -N 1 --ntasks-per-node 1 $MGARD_DIR/build/test/test_reconstructor ${DATA_DIR}/${data} 0 1 0.0115862   0
#	srun -N 1 --ntasks-per-node 1 $MGARD_DIR/build/test/test_reconstructor ${DATA_DIR}/${data} 0 1 0.00115862  0
#	srun -N 1 --ntasks-per-node 1 $MGARD_DIR/build/test/test_reconstructor ${DATA_DIR}/${data} 0 1 0.000115862 0
#
#done


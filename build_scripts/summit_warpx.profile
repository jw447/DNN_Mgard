# please set your project account
export proj=CSC143

# required dependencies
module load cmake/3.20.2
module load gcc/9.3.0
module load cuda/11.3.1

# optional: faster re-builds
module load ccache

# optional: for PSATD in RZ geometry support
module load blaspp/2021.04.01-cpu
module load lapackpp/2021.04.00-cpu

# optional: for PSATD support (CPU only)
#module load fftw/3.3.9

# optional: for QED lookup table generation support
module load boost/1.76.0

# often unstable at runtime with dependencies
module unload darshan-runtime

# optional: for Python bindings or libEnsemble
module load python/3.8.10
module load freetype/2.10.4     # matplotlib

# dependencies for numpy, blaspp & lapackpp
module load openblas/0.3.5-omp
export BLAS=${OLCF_OPENBLAS_ROOT}/lib/libopenblas.so
export LAPACK=${OLCF_OPENBLAS_ROOT}/lib/libopenblas.so

if [ -d "$HOME/sw/venvs/warpx" ]
then
  source $HOME/sw/venvs/warpx/bin/activate
fi

# an alias to request an interactive batch node for two hours
#   for paralle execution, start on the batch node: jsrun <command>
alias getNode="bsub -q debug -P $proj -W 2:00 -nnodes 1 -Is /bin/bash"
# an alias to run a command on a batch node for up to 30min
#   usage: nrun <command>
alias runNode="bsub -q debug -P $proj -W 0:30 -nnodes 1 -I"

# fix system defaults: do not escape $ with a \ on tab completion
shopt -s direxpand

# make output group-readable by default
umask 0027

# optimize CUDA compilation for V100
export AMREX_CUDA_ARCH=7.0

# compiler environment hints
export CC=$(which gcc)
export CXX=$(which g++)
export FC=$(which gfortran)
export CUDACXX=$(which nvcc)
export CUDAHOSTCXX=$(which g++)

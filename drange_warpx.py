#!/sw/summit/python/3.7/anaconda3/2020.07-rhel8/bin/python

import os
import struct
import numpy as np
import adios2 as ad
from tqdm import tqdm

nx = 512
ny = 512
nz = 512

path_orig = "/gpfs/alpine/proj-shared/csc143/jwang/io_modeling/data/run_warpx/diags/diag1_512d_128t"
path_dest = "/gpfs/alpine/proj-shared/csc143/jwang/io_modeling/data/warpx/"

def getMinMax(ts):

    vs = "{:05d}".format(int(ts*100))
    fr = ad.open(os.path.join(path_orig, "openpmd_{}.bp".format(vs)), "r")

    data = fr.read("/data/{}/fields/B/x".format(int(ts*100)), [0, 0, 0], [nx, ny, nz])
    print("ts = {}, var = {}, min = {}, max = {}".format(int(ts*100), "Bx", np.min(data), np.max(data))) 

    data = fr.read("/data/{}/fields/E/x".format(int(ts*100)), [0, 0, 0], [nx, ny, nz])
    print("ts = {}, var = {}, min = {}, max = {}".format(int(ts*100), "Ex", np.min(data), np.max(data))) 

    data = fr.read("/data/{}/fields/j/x".format(int(ts*100)), [0, 0, 0], [nx, ny, nz])
    print("ts = {}, var = {}, min = {}, max = {}".format(int(ts*100), "Jx", np.min(data), np.max(data))) 

    data = fr.read("/data/{}/fields/rho".format(int(ts*100)), [0, 0, 0], [nx, ny, nz])
    print("ts = {}, var = {}, min = {}, max = {}".format(int(ts*100), "RHO", np.min(data), np.max(data))) 

def main():

    ts_start   = 1
    ts_end     = 129
    for v in np.arange(ts_start, ts_end):
        getMinMax(v)

main()


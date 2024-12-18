#!/sw/summit/python/3.7/anaconda3/2020.07-rhel8/bin/python

import os
import struct
import numpy as np
import adios2 as ad
from tqdm import tqdm

nx = 512 
ny = 512 
nz = 512 

#path_orig = "/gpfs/alpine/proj-shared/csc143/jwang/DNN_Mgard/experiments/diags/diag1/"
#path_dest = "/gpfs/alpine/proj-shared/csc143/jwang/DNN_Mgard/data/laser_driven_electron_accl_3d_128"
path_orig = "/gpfs/alpine/proj-shared/csc143/jwang/DNN_Mgard/experiments/diags/diag_io/"
path_dest = "/gpfs/alpine/proj-shared/csc143/jwang/DNN_Mgard/data/laser_driven_electron_accl_3d_512"

def getMinMax(ts):

    vs = "{:05d}".format(int(ts*10))
    fr = ad.open(os.path.join(path_orig, "openpmd_{}.bp".format(vs)), "r")

    data = fr.read("/data/{}/fields/B/x".format(int(ts*10)), [0, 0, 0], [nx, ny, nz])
    print("ts = {}, var = {}, min = {}, max = {}".format(int(ts*10), "Bx", np.min(data), np.max(data))) 

    data = fr.read("/data/{}/fields/E/x".format(int(ts*10)), [0, 0, 0], [nx, ny, nz])
    print("ts = {}, var = {}, min = {}, max = {}".format(int(ts*10), "Ex", np.min(data), np.max(data))) 

    data = fr.read("/data/{}/fields/j/x".format(int(ts*10)), [0, 0, 0], [nx, ny, nz])
    print("ts = {}, var = {}, min = {}, max = {}".format(int(ts*10), "Jx", np.min(data), np.max(data))) 

    data = fr.read("/data/{}/fields/rho".format(int(ts*10)), [0, 0, 0], [nx, ny, nz])
    print("ts = {}, var = {}, min = {}, max = {}".format(int(ts*10), "RHO", np.min(data), np.max(data))) 

def main():
    getMinMax(8)

main()


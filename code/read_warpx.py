#!/sw/summit/python/3.7/anaconda3/2020.07-rhel8/bin/python

import os
import struct
import numpy as np
import adios2 as ad
from tqdm import tqdm

nx = 512 
ny = 512 
nz = 512 

path_orig = "/gpfs/alpine/proj-shared/csc143/jwang/DNN_Mgard/experiments/diags/diag_io/"
#path_dest = "/gpfs/alpine/proj-shared/csc143/jwang/DNN_Mgard/data/laser_driven_electron_accl_3d_128"
path_dest = "/gpfs/alpine/proj-shared/csc143/jwang/DNN_Mgard/data/laser_driven_electron_accl_3d_512"

def read_data(ts):

    vs = "{:05d}".format(int(ts*10))
    fr = ad.open(os.path.join(path_orig, "openpmd_{}.bp".format(vs)), "r")

    #data = fr.read("/data/{}/fields/B/x".format(int(ts*10)), [0, 0, 0], [nx, ny, nz])
    #with open(os.path.join(path_dest, "openpmd{}_bx.dat".format(vs)), "wb") as bf:
    #    s = struct.pack("={}d".format(nx*ny*nz), *data.flatten("C"))
    #    bf.write(s)

    data = fr.read("/data/{}/fields/E/x".format(int(ts*10)), [0, 0, 0], [nx, ny, nz])
    with open(os.path.join(path_dest, "openpmd{}_ex.dat".format(vs)), "wb") as bf:
        s = struct.pack("={}d".format(nx*ny*nz), *data.flatten("C"))
        bf.write(s)

    #data = fr.read("/data/{}/fields/j/x".format(int(ts*10)), [0, 0, 0], [nx, ny, nz])
    #with open(os.path.join(path_dest, "openpmd{}_jx.dat".format(vs)), "wb") as bf:
    #    s = struct.pack("={}d".format(nx*ny*nz), *data.flatten("C"))
    #    bf.write(s)

    #data = fr.read("/data/{}/fields/rho".format(int(ts*10)), [0, 0, 0], [nx, ny, nz])
    #with open(os.path.join(path_dest, "openpmd{}_rho.dat".format(vs)), "wb") as bf:
    #    s = struct.pack("={}d".format(nx*ny*nz), *data.flatten("C"))
    #    bf.write(s)

def main():

    ts_start   = 8
    ts_end     = 10
    for v in tqdm(np.arange(ts_start, ts_end, 2)):
        read_data(v)

main()


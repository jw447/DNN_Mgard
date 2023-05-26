#!/sw/summit/python/3.7/anaconda3/2020.07-rhel8/bin/python

import os
import struct
import numpy as np
import adios2 as ad
from tqdm import tqdm

def main():
    f = open("c0_gen.txt", "a")
    for v in tqdm(np.arange(65536)):
        line = "{:1.2} 5.54 5.54 \n".format(np.random.randint(1, 554 + 1)/100 )
        f.write(line)
    f.close()

    f = open("c1_gen.txt", "a")
    for v in tqdm(np.arange(65536)):
        line = "5.54 {:1.2} 5.54 \n".format(np.random.randint(1, 554 + 1)/100 )
        f.write(line)
    f.close()

    f = open("c2_gen.txt", "a")
    for v in tqdm(np.arange(65536)):
        line = "5.54 5.54 {:1.2} \n".format(np.random.randint(1, 554 + 1)/100 )
        f.write(line)
    f.close()
main()

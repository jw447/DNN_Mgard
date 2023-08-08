#!/Users/jonwang/miniconda3/bin/python

import os
import numpy as np
import csv
import pandas as pd
from glob2 import glob

if __name__ == "__main__":    
    print("Running log2csv program...")

    #logfiles = glob("{}/run_mgard_*o.*".format("Cesm_aerod_v_1_1800_3600"))
    logfiles = glob("Scale_qc-98x1200x1200/run_mgard_*o.*")
    for logname in logfiles:
        print("Converting {}".format(logname))
        with open(logname, "r") as logfile:
            csvname = logfile.readline().split(" ", 3)[1].split("/")[-1].lower().replace(".bin", "").replace(".f32", "").replace(".dat", "").replace(".log10", "_log")
            c0 = []
            c1 = []
            c2 = []
            abse = []
            estie = []
            l0 = []
            l1 = []
            l2 = []
            io = []
            maxe = []
            mse = []
            psnr = []
            for line in logfile.readlines():
                line = line.replace("\n", "")
                if "Requested_tolerance" in line:
                    c0.append(line.split(",", 18)[0])
                    c1.append(line.split(",", 18)[1])
                    c2.append(line.split(",", 18)[2])
                    abse.append(line.split(",", 18)[4])
                    estie.append(line.split(",", 18)[6])
                    l0.append(line.split(",", 18)[7])
                    l1.append(line.split(",", 18)[8])
                    l2.append(line.split(",", 18)[9])
                    io.append(line.split(",", 18)[11])
                    maxe.append(line.split(",", 18)[13])
                    mse.append(line.split(",", 18)[15])
                    psnr.append(line.split(",", 18)[17])

        try: 
            csvname = csvname + "_{:.2e}.csv".format(np.float64(abse[0]))
            csvdata = pd.DataFrame({
                "c0":                  c0,
                "c1":                  c1,
                "c2":                  c2,
                "Requested_tolerance": abse,
                "estimated_error":     estie,
                "l0":                  l0,
                "l1":                  l1,
                "l2":                  l2,
                "Total_retrieve_size": io,
                "MaxErr":              maxe,
                "MSE":                 mse,
                "PSNR":                psnr,
            })
            csvdata = csvdata.drop_duplicates()
            csvdata.to_csv(csvname, index=False)
            print("{} generated".format(csvname))
        except:
            print("Please check {}. Skipping..".format(logname))

    print("log2csv program finished.")



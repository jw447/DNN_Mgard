#!/Users/jonwang/miniconda3/bin/python

import os
import numpy as np
import csv
import pandas as pd
from glob2 import glob

def log2csv(lines, num_lvl):
    if num_lvl == 2:
        dict = {"c0":np.random.randn(len(df_lines)),"c1":np.random.randn(len(df_lines)),
                "Requested_tolerance":np.random.randn(len(df_lines)),"estimated_error":np.random.randn(len(df_lines)),
                "l0":np.random.randn(len(df_lines)),"l1":np.random.randn(len(df_lines)),
                "Total_retrieve_size":np.random.randn(len(df_lines)),"MaxErr":np.random.randn(len(df_lines)),
                "MSE":np.random.randn(len(df_lines)),"PSNR":np.random.randn(len(df_lines))}
    elif num_lvl == 3:
        dict = {"c0":np.random.randn(len(df_lines)),"c1":np.random.randn(len(df_lines)),"c2":np.random.randn(len(df_lines)),
                "Requested_tolerance":np.random.randn(len(df_lines)),"estimated_error":np.random.randn(len(df_lines)),
                "l0":np.random.randn(len(df_lines)),"l1":np.random.randn(len(df_lines)),"l2":np.random.randn(len(df_lines)),
                "Total_retrieve_size":np.random.randn(len(df_lines)),"MaxErr":np.random.randn(len(df_lines)),
                "MSE":np.random.randn(len(df_lines)),"PSNR":np.random.randn(len(df_lines))}
    elif num_lvl == 4:
        dict = {"c0":np.random.randn(len(df_lines)),"c1":np.random.randn(len(df_lines)),"c2":np.random.randn(len(df_lines)),"c3":np.random.randn(len(df_lines)),
                "Requested_tolerance":np.random.randn(len(df_lines)),"estimated_error":np.random.randn(len(df_lines)),
                "l0":np.random.randn(len(df_lines)),"l1":np.random.randn(len(df_lines)),"l2":np.random.randn(len(df_lines)),"l3":np.random.randn(len(df_lines)),
                "Total_retrieve_size":np.random.randn(len(df_lines)),"MaxErr":np.random.randn(len(df_lines)),
                "MSE":np.random.randn(len(df_lines)),"PSNR":np.random.randn(len(df_lines))}
        
    df = pd.DataFrame(dict, index=range(len(df_lines)))
    df.loc[range(len(df_lines)), df.columns] = df_lines
    return df

if __name__ == "__main__":    
    print("Running log2csv program...")

    #logfiles = glob("{}/run_mgard_*o.*".format("Cesm_aerod_v_1_1800_3600"))
    logfiles = glob("run_mgard_*o.*")
    #logfiles = ["run_mgard_hurricaneo.3104932","run_mgard_nyxo.3104935","run_mgard_scaleo.3104946"]
    #logfiles = ["Hurricane_cloudf48_log/run_mgard_hurricaneo.3100916"]
    for logname in logfiles:
        print("Converting {}".format(logname))
        with open(logname, "r") as logfile:
            csvname = logfile.readline().split(" ", 3)[1].split("/")[-1].lower().replace(".bin", "").replace(".f32", "").replace(".dat", "").replace(".log10", "_log")
             
            df_lines = []
            for line in logfile.readlines():
                if "Requested_tolerance" in line:
                    df_line = line.replace("Requested_tolerance,", "").replace("estimated_error,", "").replace("Total_retrieve_size,", "")
                    df_line = df_line.replace("MaxErr,", "").replace("MSE,", "").replace("PSNR,", "").replace("\n","")
                    df_lines.append(df_line.split(","))

        df = log2csv(df_lines, num_lvl=3)
        csvname = csvname + "_{:.2e}.csv".format(np.float64(df.Requested_tolerance.values[0]))
        df.drop_duplicates().to_csv(csvname, index=False)
 
    print("log2csv program finished.")



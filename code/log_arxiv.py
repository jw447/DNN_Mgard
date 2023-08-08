#!/Users/jonwang/miniconda3/bin/python

import os
from glob2 import glob

if __name__ == "__main__":
    print("Running log file archive program...")
    for fname in glob("run_mgard_*o.*"):
        #fname = "run_mgard_scaleo.3094889"
        fname_base = fname.split(".", 2)[0]
        fname_idx = fname.split(".", 2)[1]
        appname = fname_base.replace("run_mgard_", "")[:-1]
        fname_e = fname_base[:-1]+"e."+fname_idx
        with open(fname, "r") as f:
            try:
                logname = f.readline().split(" ", 3)[1].split("/")[-1].replace(".dat", "")
                dest_dir = appname.capitalize()+"_"+logname.lower().replace(".bin", "").replace(".f32", "").replace(".log10", "_log")
                #print(fname_base, fname_idx, appname, fname_e, dest_dir)
                if os.path.exists(dest_dir):
                    pass
                else:
                    pass
                    os.mkdir(dest_dir)
                    print("creating {}".format(dest_dir))
                os.rename(fname,   os.path.join(dest_dir, fname))
                os.rename(fname_e, os.path.join(dest_dir, fname_e))
            except:
                print("Please check:{}".format(fname))
    print("Log file archive program finished.")


# Run this from the local terminal..
import pandas as pd
import numpy as np
from tqdm import tqdm

import copy
from sklearn import preprocessing

import matplotlib.pyplot as plt
from mpl_toolkits.axes_grid1 import make_axes_locatable
from mpl_toolkits import mplot3d
#%matplotlib

import matplotlib as mpl
mpl.rcParams['axes.linewidth'] = 2

import seaborn as sns
sns.set_style("whitegrid")

current_palette = sns.color_palette("deep")

fontsize=20

from scripts.util import load_var, scatter3D

import alphashape
from descartes import PolygonPatch

## Those old ones before 08/03/2023
Time_paths_old = [
    "datasets/Warpx_00300_bx/run_mgard_1e-1_full.csv",
    "datasets/Warpx_00300_bx/run_mgard_1e-3_full.csv",
    "datasets/Warpx_00300_bx/run_mgard_1e-5_full.csv",
    "datasets/Warpx_00300_bx/run_mgard_1e-7_full.csv",
    "datasets/Warpx_00300_ex/run_mgard_1e-1_full.csv",
    "datasets/Nyx_baryon_density/run_mgard_1e-1_full.csv",
    "datasets/Nyx_dark_matter_density/run_mgard_1e-1_full.csv",
    "datasets/Nyx_temperature/run_mgard_1e-1_full.csv",
    "datasets/Nyx_velocity_x/run_mgard_1e-1_full.csv",
    "datasets/Hurrican_cloud48_log/run_mgard_1e-1_full.csv",
    "datasets/Hurrican_qcloud48_log/run_mgard_1e-1_full.csv",
    ]

# New applications across error bounds - 08/03/2023.
Time_paths_new = [
    # hurricane
    # "datasets/cloudf48_log_1.00e-06.csv",
    # "datasets/cloudf48_log_1.01e-04.csv",
    # "datasets/cloudf48_log_1.02e-02.csv",
    # "datasets/cloudf48_log_1.02e+00.csv",
    # "datasets/precipf48_log_3.50e-06.csv",
    # "datasets/precipf48_log_3.58e-04.csv",
    # "datasets/precipf48_log_3.58e-02.csv",
    # "datasets/precipf48_log_3.58e+00.csv",
    # "datasets/qgraupf48_log_3.50e-06.csv",
    # "datasets/qgraupf48_log_3.57e-04.csv",
    # "datasets/qgraupf48_log_3.58e-02.csv",
    # "datasets/qgraupf48_log_3.58e+00.csv",
    # "datasets/qicef48_log_1.80e-06.csv",
    # "datasets/qicef48_log_1.86e-04.csv",
    # "datasets/qicef48_log_1.87e-02.csv",
    # "datasets/qicef48_log_1.87e+00.csv",

    ##  nyx
    # "datasets/baryon_density_1.16e-02.csv",
    # "datasets/baryon_density_1.16e+00.csv",
    # "datasets/baryon_density_1.16e+02.csv",
    # "datasets/baryon_density_1.16e+04.csv",
    # "datasets/dark_matter_density_1.38e-03.csv",
    # "datasets/dark_matter_density_1.38e-01.csv",
    # "datasets/dark_matter_density_1.38e+01.csv",
    # "datasets/dark_matter_density_1.38e+03.csv",
    # "datasets/temperature_4.78e-01.csv",
    # "datasets/temperature_4.78e+01.csv",
    # "datasets/temperature_4.78e+03.csv",
    # "datasets/temperature_4.78e+05.csv",
    # "datasets/velocity_x_8.23e+00.csv",
    # "datasets/velocity_x_8.23e+02.csv",
    # "datasets/velocity_x_8.23e+04.csv",
    # "datasets/velocity_x_8.23e+06.csv",

    ### scale
    # "datasets/pres-98x1200x1200_9.95e-03.csv",
    "datasets/pres-98x1200x1200_9.95e-01.csv",
    "datasets/pres-98x1200x1200_9.95e+01.csv",
    "datasets/pres-98x1200x1200_9.95e+03.csv",
    # "datasets/qc-98x1200x1200_3.01e-10.csv",
    "datasets/qc-98x1200x1200_3.01e-08.csv",
    "datasets/qc-98x1200x1200_3.01e-06.csv",
    "datasets/qc-98x1200x1200_3.01e-04.csv",
    # "datasets/qg-98x1200x1200_1.49e-09.csv",
    "datasets/qg-98x1200x1200_1.49e-07.csv",
    "datasets/qg-98x1200x1200_1.49e-05.csv",
    "datasets/qg-98x1200x1200_1.49e-03.csv",
    # "datasets/qi-98x1200x1200_1.60e-10.csv",
    "datasets/qi-98x1200x1200_1.60e-08.csv",
    "datasets/qi-98x1200x1200_1.60e-06.csv",
    "datasets/qi-98x1200x1200_1.60e-04.csv",
    ]

threshold = 0.07

data0 = pd.read_csv(Time_paths_new[0]).drop_duplicates()
xdata, ydata, zdata, l0, l1, l2, redata, eedata, medata, trsdata = load_var(data0)
reqerr = redata[0]

c1 = data0[(data0.estimated_error >= reqerr*(1-threshold))&(data0.MaxErr > reqerr)].c1.values
c2 = data0[(data0.estimated_error >= reqerr*(1-threshold))&(data0.MaxErr > reqerr)].c2.values

# for i in [0.5, 1.5, 2.5, 3.5]:
alpha_shape = alphashape.alphashape(tuple(zip(c1, c2)), 0.5)

plt.rcParams["figure.figsize"] = [6, 6]
fig = plt.figure()
ax1 = fig.add_subplot(111)
ax1.scatter(c1, c2)
ax1.add_patch(PolygonPatch(alpha_shape, alpha=0.2))
plt.show()


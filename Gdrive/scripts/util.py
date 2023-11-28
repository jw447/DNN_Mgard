import pandas as pd
import numpy as np
from tqdm import tqdm

import copy
from sklearn import preprocessing

import matplotlib.pyplot as plt
from mpl_toolkits.axes_grid1 import make_axes_locatable
from mpl_toolkits import mplot3d
#%matplotlib inline

import matplotlib as mpl
mpl.rcParams['axes.linewidth'] = 2

import seaborn as sns
sns.set_style("whitegrid")

current_palette = sns.color_palette("deep")
fontsize=20

def load_var(data, sort=False):
    """
    return the variables from data.
    input: data, organized in csv format.
    ouput: c0, c1, c2, l0, l1, l2, req_err, esti_err, max_err, io_size
    """
    if sort:
        data = data.sort_values(by=['c0', "c1", "c2"], ascending=True)
    xdata = data["c0"].values
    ydata = data["c1"].values
    zdata = data["c2"].values
    l0 = data["l0"].values
    l1 = data["l1"].values
    l2 = data["l2"].values
    redata = data["Requested_tolerance"].values
    eedata = data["estimated_error"].values
    medata = data["MaxErr"].values
    trsdata = data["Total_retrieve_size"].values

    return xdata, ydata, zdata, l0, l1, l2, redata, eedata, medata, trsdata

def scatter3D(data, axs, var, alpha, elev=30, azim=45, roll=0):
    xdata, ydata, zdata, l0, l1, l2, redata, eedata, medata, trsdata = load_var(data)
    vdata = data[var].values

    if var == "estimated_error":
        cmap = "viridis"
    elif var == "MaxErr":
        cmap = "viridis"
    elif var == "Total_retrieve_size":
        cmap = "viridis"

    axs.view_init(elev=elev, azim=azim, roll=roll)
    img = axs.scatter(xdata, ydata, zdata, c=vdata, cmap=cmap, s=1.5, alpha=alpha, vmin=np.min(vdata), vmax=np.max(vdata))

    if azim in [0, 45]:
        # try not to change this
        axs.plot(np.linspace(0, 6, num=len(xdata)), np.linspace(0, 0, num=len(xdata)), np.linspace(0, 0, num=len(xdata)), color='grey',  alpha=.5)
        axs.plot(np.linspace(0, 0, num=len(xdata)), np.linspace(0, 0, num=len(xdata)), np.linspace(0, 6, num=len(xdata)), color='grey',  alpha=.5)
        axs.plot(np.linspace(0, 0, num=len(xdata)), np.linspace(0, 6, num=len(xdata)), np.linspace(0, 0, num=len(xdata)), color='grey',  alpha=.5)

        axs.plot(np.linspace(0, 6, num=len(xdata)), np.linspace(0, 0, num=len(xdata)), np.linspace(6, 6, num=len(xdata)), color='black', alpha=1)
        axs.plot(np.linspace(0, 6, num=len(xdata)), np.linspace(6, 6, num=len(xdata)), np.linspace(0, 0, num=len(xdata)), color='black', alpha=1)
        axs.plot(np.linspace(0, 6, num=len(xdata)), np.linspace(6, 6, num=len(xdata)), np.linspace(6, 6, num=len(xdata)), color='black', alpha=1)

        axs.plot(np.linspace(0, 0, num=len(xdata)), np.linspace(6, 6, num=len(xdata)), np.linspace(0, 6, num=len(xdata)), color='black', alpha=1)
        axs.plot(np.linspace(6, 6, num=len(xdata)), np.linspace(0, 0, num=len(xdata)), np.linspace(0, 6, num=len(xdata)), color='black', alpha=1)
        axs.plot(np.linspace(6, 6, num=len(xdata)), np.linspace(6, 6, num=len(xdata)), np.linspace(0, 6, num=len(xdata)), color='black', alpha=1)

        axs.plot(np.linspace(0, 0, num=len(xdata)), np.linspace(0, 6, num=len(xdata)), np.linspace(6, 6, num=len(xdata)), color='black', alpha=1)
        axs.plot(np.linspace(6, 6, num=len(xdata)), np.linspace(0, 6, num=len(xdata)), np.linspace(0, 0, num=len(xdata)), color='black', alpha=1)
        axs.plot(np.linspace(6, 6, num=len(xdata)), np.linspace(0, 6, num=len(xdata)), np.linspace(6, 6, num=len(xdata)), color='black', alpha=1)

    if azim == 225:
        axs.plot(np.linspace(6, 6, num=len(xdata)), np.linspace(0, 6, num=len(xdata)), np.linspace(0, 0, num=len(xdata)), color='grey', alpha=.5)
        axs.plot(np.linspace(0, 6, num=len(xdata)), np.linspace(6, 6, num=len(xdata)), np.linspace(0, 0, num=len(xdata)), color='grey', alpha=.5)
        axs.plot(np.linspace(6, 6, num=len(xdata)), np.linspace(6, 6, num=len(xdata)), np.linspace(0, 6, num=len(xdata)), color='grey', alpha=.5)

        axs.plot(np.linspace(0, 6, num=len(xdata)), np.linspace(0, 0, num=len(xdata)), np.linspace(0, 0, num=len(xdata)), color='black', alpha=1)
        axs.plot(np.linspace(0, 0, num=len(xdata)), np.linspace(0, 0, num=len(xdata)), np.linspace(0, 6, num=len(xdata)), color='black', alpha=1)
        axs.plot(np.linspace(0, 0, num=len(xdata)), np.linspace(0, 6, num=len(xdata)), np.linspace(0, 0, num=len(xdata)), color='black', alpha=1)

        axs.plot(np.linspace(0, 6, num=len(xdata)), np.linspace(0, 0, num=len(xdata)), np.linspace(6, 6, num=len(xdata)), color='black', alpha=1)
        axs.plot(np.linspace(0, 6, num=len(xdata)), np.linspace(6, 6, num=len(xdata)), np.linspace(6, 6, num=len(xdata)), color='black', alpha=1)
        axs.plot(np.linspace(0, 0, num=len(xdata)), np.linspace(6, 6, num=len(xdata)), np.linspace(0, 6, num=len(xdata)), color='black', alpha=1)

        axs.plot(np.linspace(6, 6, num=len(xdata)), np.linspace(0, 0, num=len(xdata)), np.linspace(0, 6, num=len(xdata)), color='black', alpha=1)
        axs.plot(np.linspace(0, 0, num=len(xdata)), np.linspace(0, 6, num=len(xdata)), np.linspace(6, 6, num=len(xdata)), color='black', alpha=1)
        axs.plot(np.linspace(6, 6, num=len(xdata)), np.linspace(0, 6, num=len(xdata)), np.linspace(6, 6, num=len(xdata)), color='black', alpha=1)


    axs.set_xlim(0, 6)
    axs.set_ylim(0, 6)
    axs.set_zlim(0, 6)

    axs.set_xlabel('C0', labelpad=10, fontsize=fontsize)
    axs.set_ylabel('C1', labelpad=10, fontsize=fontsize)
    axs.set_zlabel('C2', labelpad=10, fontsize=fontsize)
    axs.set_xticks([0, 1, 2, 3, 4, 5, 6]);
    axs.set_yticks([0, 1, 2, 3, 4, 5, 6]);
    axs.set_zticks([0, 1, 2, 3, 4, 5, 6]);
    axs.set_xticklabels([0, 1, 2, 3, 4, 5, 6], fontsize=fontsize);
    axs.set_yticklabels([0, 1, 2, 3, 4, 5, 6], fontsize=fontsize);
    axs.set_zticklabels([0, 1, 2, 3, 4, 5, 6], fontsize=fontsize);

    return img



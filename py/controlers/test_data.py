__author__ = 'Jwely'

from py.constructors import build_axial_vortex

# some of my favorite colormaps for quick reference
from matplotlib import cm
'''
cm.seismic           # diverging colormap
cm.bone_r            # sequential colormap
cm.hsv               # cyclical colormap
cm.jet               # default colormap
cm.nipy_spectral     # qualitative spectrum colormap
'''

def test_data():

    kwargs = {"v3d_dir": "../../data_test",
              "pkl_dir": "../pickles",
              "name_tag": "test_data",
              "include_dynamic": False,
              "velocity_fs": 15.22,
              "force_recalc": True}

    av = build_axial_vortex(**kwargs)
    #av.stream_plot()
    av.contour_plot('T')
    #av.scatter_plot2('r_mesh', 'W')
    av.scatter_plot('r_mesh', 'T', 'cte', cmap=cm.jet,
                        title="Tangential Velocity and Turbulent Kinetic Energy",
                        x_label="Distance to vortex core (mm)",
                        y_label="Tangential velocity (m/s)",
                        c_label="Turbulent kinetic energy (2TKE)")
    #av.get_scatter_plot2('r_mesh', 'cte')
    #av.get_contour_plot('T')


if __name__ == "__main__":
    test_data()

import numpy as np
import scipy.io as io
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d.axes3d import Axes3D
import matplotlib.cm as cm
import matplotlib.animation as animation

# load matdata
data = io.loadmat('../EEG-sample/close.mat')
showdata = data['y']
plt.plot(showdata[0], showdata[1])
print(showdata.shape)


def eeg_3d(showdata, starttime=0, endtime=60):
    # Method to display eegdata in 3d.
    fig = plt.figure(figsize=(10, 5))
    ax = fig.add_subplot(111, projection="3d")
    ax.view_init(elev=30, azim=-165)
    for i in range(8):
        plt.plot(showdata[0, 256*starttime+1:256*endtime],
                 np.full_like(showdata[0, 256*starttime+1:256*endtime], i+1),
                 showdata[(i+1), 256*starttime+1:256*endtime], linewidth=0.8)
    ax.set_xlabel('Time', fontsize=10)
    ax.set_ylabel('Electrode', fontsize=10)
    ax.set_zlabel('mV', fontsize=10)
    ax.xaxis._axinfo['label']['space_factor'] = 0.1


eeg_3d(showdata, starttime=5, endtime=6)

# Attaching 3D axis to the figure
fig = plt.figure(figsize=(10, 5))
ax = fig.add_subplot(111, projection="3d")
ax.set_xlabel('Time', fontsize=10)
ax.set_ylabel('Electrodes', fontsize=10)
ax.set_zlabel('microV', fontsize=10)
ax.view_init(elev=25, azim=-165)
ax.xaxis._axinfo['label']['space_factor'] = 0.2
ax.set(zlim=[-128, 128])

# points to plot in 3D
starttime = 4
set_start = starttime*256
signals = []
for count in range(8):
    signal, = ax.plot(showdata[0, 0:256], np.full_like(showdata[0, 0:256],
                      count+1), showdata[count+1, set_start:256+set_start])
    signals.append(signal)


def update(i):
    for count, signal in enumerate(signals):
        signal.set_data(showdata[0, 0:256], np.full_like(showdata[0, 0:256], count+1))
        signal.set_3d_properties(showdata[count+1, i+set_start:i+256+set_start])
        signal.set_alpha(1)
        # signal.set_color(cm.hsv(np.abs(np.sin(i/256))+(count/24)))


ani = animation.FuncAnimation(fig, update, 256, interval=100)
# ani.save("image/eeg-anim.gif", writer="imagemagick")
plt.show()

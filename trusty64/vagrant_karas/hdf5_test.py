import h5py
import numpy as np
import sys

# hdf_fname = sys.argv[1]
hdf_fname = 'ByType.2'

# X_fname = sys.argv[2]
X_fname = 'ByType.2/X'

# y_fname = sys.argv[3]
y_fname = 'ByType.2/y'

# rows_fname    = sys.argv[4]
rows_fname    = 'ByType.2/row.h'

# cols_fname    = sys.argv[5]
cols_fname    = 'ByType.2/col.h'

# y_map_fname   = sys.argv[6]
y_map_fname   = 'ByType.2/y.map'


X = np.loadtxt(open(X_fname, "rb"), dtype=float, delimiter='\t')
y = np.loadtxt(open(y_fname, "rb"), dtype=int, delimiter='\t')
rows  = np.loadtxt(open(rows_fname, "rb"), dtype=float, delimiter='\t')
cols  = np.loadtxt(open(cols_fname, "rb"), dtype=float, delimiter='\t')
y_map = np.loadtxt(open(y_map_fname, "rb"), dtype=float, delimiter='\t')

# Create HDF5 file, fail if exists
f = h5py.File(hdf_fname + ".hdf5", "w-")

# Create HDF5 datasets in file
dset_X = f.create_dataset(X_fname, X, dtype='float')
dset_y = f.create_dataset(y_fname, y, dtype='int')
dset_rows  = f.create_dataset(y_fname, rows, dtype='int')
dset_cols  = f.create_dataset(y_fname, cols, dtype='int')
dset_y_map = f.create_dataset(y_fname, y_map, dtype='int')

# rows  = f.create_dataset(rows_fname, (100,), dtype='i')
# cols  = f.create_dataset(cols_fname, (100,), dtype='i')
# y_map = f.create_dataset(y_map_fname, (100,), dtype='i')

# f.write()
# f.close()


# Read data back from hdf5 file on disk
# f = h5py.File(hdf_fname + ".hdf5", "r")
# X = f['X']
# y = f['y']



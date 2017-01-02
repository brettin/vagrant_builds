apt-get install -y libhdf5-dev
apt-get install -y hdf5-tools
apt-get install -y python-h5py
apt-get install -y python-tables python-tables-data python-tables-dbg python-tables-lib

# h5cc -showconfig
# reports Parallel HDF5: no

h5cc -showconfig

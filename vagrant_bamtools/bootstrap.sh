#!/usr/bin/env bash

# set up for gnko

apt-get update
apt-get install -y build-essential
apt-get install -y git
apt-get install -y cmake
apt-get install -y libncurses5-dev
apt-get install -y libncurses5
apt-get install -y dh-autoreconf
apt-get install -y pkg-config


git clone git://github.com/pezmaster31/bamtools.git
pushd bamtools
mkdir build
pushd build
cmake ..
make
popd
cp -r ./bin/* /usr/local/bin/
cp -r ./lib/* /usr/local/lib/
cp -r ./include/* /usr/local/include/




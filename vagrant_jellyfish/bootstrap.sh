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

# TODO - how to get jellyfish
tar -xvf jellyfish-2.1.3.tar 
pushd jellyfish-2.1.3/
./configure --prefix=/usr/local
make
make install
popd
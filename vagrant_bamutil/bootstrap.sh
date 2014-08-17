#!/usr/bin/env bash

# set up for bamutil 

apt-get update
apt-get install -y build-essential
apt-get install -y git
apt-get install -y cmake
apt-get install -y libncurses5-dev
apt-get install -y libncurses5
apt-get install -y dh-autoreconf
apt-get install -y pkg-config


git clone https://github.com/statgen/bamUtil.git
pushd bamUtil
make cloneLib
make
make install INSTALLDIR=/usr/local/bin

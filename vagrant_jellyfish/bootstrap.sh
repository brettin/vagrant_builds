#!/usr/bin/env bash

apt-get update
apt-get install -y build-essential
apt-get install -y git
apt-get install -y cmake
apt-get install -y libncurses5-dev
apt-get install -y libncurses5
apt-get install -y dh-autoreconf
apt-get install -y pkg-config

wget -s ftp://ftp.genome.umd.edu/pub/jellyfish/jellyfish-2.1.3.tar.gz
gunzip jellyfish-2.1.3.tar.gz
tar -xvf jellyfish-2.1.3.tar 
pushd jellyfish-2.1.3/
./configure --prefix=/usr/local
make
make install
popd

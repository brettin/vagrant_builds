#!/usr/bin/env bash

apt-get update
apt-get install -y build-essential
apt-get install -y git
apt-get install -y cmake
apt-get install -y libncurses5-dev
apt-get install -y libncurses5
apt-get install -y dh-autoreconf
apt-get install -y pkg-config

wget https://github.com/gmarcais/Jellyfish/releases/download/v2.3.0/jellyfish-2.3.0.tar.gz
# wget -q -o wget.log ftp://ftp.genome.umd.edu/pub/jellyfish/jellyfish-2.1.3.tar.gz

gunzip jellyfish-2.3.0.tar.gz
# gunzip jellyfish-2.1.3.tar.gz

# tar -xvf jellyfish-2.1.3.tar 
tar -xvf jellyfish-2.3.0.tar

# pushd jellyfish-2.1.3/
pushd jellyfish-2.3.0

./configure --prefix=/usr/local
make
make install
popd

echo "export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH" >> .profile
echo "export MANPATH=/usr/local/share/man:$MANPATH" >> .profile
echo "export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH" >> .profile

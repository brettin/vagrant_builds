#!/usr/bin/env bash

target=${TARGET-/usr/local}

if [[ $# -ne 0 ]] ; then
        target=$1
        shift
fi


apt-get update
apt-get install -y build-essential
apt-get install -y git
apt-get install -y dh-autoreconf
apt-get install -y pkg-config
apt-get install -y cmake
apt-get install -y libncurses5-dev
apt-get install -y libncurses5

apt-get install -y libboost-all-dev
apt-get install -y g++
apt-get install -y scons
apt-get install -y zlib1g-dev
apt-get install -y curl

# Odd requirement, this is required on precise
# but not on trusty.
cp /usr/lib/boost* /usr/lib/x86_64-linux-gnu/

git clone https://github.com/samtools/htslib.git

# compile the source
pushd htslib/
autoconf
./configure --prefix=$target
make
make install
popd

git clone https://github.com/samtools/samtools.git
pushd samtools
git checkout master
make
make install PREFIX=$target
popd

#stable release version
wget https://bitbucket.org/berkeleylab/metabat/get/master.tar.gz
tar xzvf master.tar.gz
cd berkeleylab-metabat-*

#run the installation script
scons install PREFIX=$target

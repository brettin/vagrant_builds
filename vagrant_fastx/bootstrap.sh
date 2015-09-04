#!/usr/bin/env bash

# set up for bamutil 

target=${TARGET-/usr/local}

if [[ $# -ne 0 ]] ; then
        target=$1
        shift
fi


apt-get update
apt-get install -y build-essential
apt-get install -y git
apt-get install -y cmake
apt-get install -y libncurses5-dev
apt-get install -y libncurses5
apt-get install -y dh-autoreconf
apt-get install -y pkg-config

apt-get install -y libgd2-xpm-dev
apt-get install -y cpanminus

cpanm install PerlIO::gzip
cpanm install inc::latest
cpanm install GD::Graph::bars

apt-get install -y gnuplot

mkdir -p $target/bin
mkdir -p $target/lib
mkdir -p $target/include

git clone https://github.com/agordon/libgtextutils.git
pushd libgtextutils
./reconf
./configure --prefix=$target
make
make install
popd

git clone https://github.com/agordon/fastx_toolkit.git
pushd fastx_toolkit
./reconf 
./configure
make
make install
popd 


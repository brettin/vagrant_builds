#!/usr/bin/env bash

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

apt-get install -y zlib1g
apt-get install -y zlib1g-dev

apt-get install -y lib64bz2-1.0
apt-get install -y libbz2-1.0 
apt-get install -y libbz2-ocaml 

wget http://research-pub.gene.com/gmap/src/gmap-gsnap-2015-12-31.v9.tar.gz
tar -xzvf gmap-gsnap-2015-12-31.v9.tar.gz
cd gmap*

mkdir -p $target/gmapdb

./configure --prefix=$target --with-gmapdb=$target/gmapdb
make
make check
make install


mkdir -p $target/bin
cp * $target/bin


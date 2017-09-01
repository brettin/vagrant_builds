#!/usr/bin/env bash

target=${TARGET-/usr/local}

if [[ $# -ne 0 ]] ; then
        target=$1
        shift
fi

apt-get update
apt-get install -y build-essential
apt-get install -y libx11-dev

wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/2.2.30/ncbi-blast-2.2.30+-src.tar.gz
tar -xvzf ncbi-blast-2.2.30+-src.tar.gz 
cd ncbi-blast-2.2.30+-src
cd c++/
./configure --prefix=$target

make
make install

cd ../..


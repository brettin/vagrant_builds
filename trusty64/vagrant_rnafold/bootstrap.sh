#!/usr/bin/env bash

target=${TARGET-/usr/local}

if [[ $# -ne 0 ]] ; then
        target=$1
        shift
fi


apt-get update
apt-get install -y build-essential

wget http://www.tbi.univie.ac.at/~ronny/RNA/packages/source/ViennaRNA-2.1.3.tar.gz
tar -xvzf ViennaRNA-2.1.3.tar.gz 

# specific install locations
mkdir -p $target/bin
mkdir -p $target/lib
mkdir -p $target/info
mkdir -p $target/man
mkdir -p $target/share
mkdir -p $target/include


cd ViennaRNA-2.1.3

./configure --prefix=$target --datadir=$target
make
make install

cd ..

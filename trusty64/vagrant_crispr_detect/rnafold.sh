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

cd ViennaRNA-2.1.3

./configure --prefix=$target
make
make install

cd ..

#!/usr/bin/env bash

target=${TARGET-/usr/local}

if [[ $# -ne 0 ]] ; then
        target=$1
        shift
fi

apt-get update
apt-get install -y build-essential

wget http://www.clustal.org/download/current/clustalw-2.1.tar.gz
tar -xvzf clustalw-2.1.tar.gz 

cd clustalw-2.1

./configure PREFIX=$target
make
make install

cd ..

ln -s $target/bin/clustalw2 $target/bin/clustalw

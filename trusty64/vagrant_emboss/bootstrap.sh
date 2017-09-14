#!/usr/bin/env bash

target=${TARGET-/usr/local}

if [[ $# -ne 0 ]] ; then
        target=$1
        shift
fi

apt-get update
apt-get install -y build-essential
apt-get install -y libx11-dev

wget ftp://emboss.open-bio.org/pub/EMBOSS/EMBOSS-6.6.0.tar.gz
tar -xvzf EMBOSS-6.6.0.tar.gz

mkdir -p $target
mkdir -p $target/bin
mkdir -p $target/lib

cd EMBOSS-6.6.0

./configure --prefix=$target
make
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
make install

cd ..

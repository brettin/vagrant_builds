#!/usr/bin/env bash

target=${TARGET-/usr/local}

if [[ $# -ne 0 ]] ; then
        target=$1
        shift
fi


apt-get update
apt-get install -y build-essential
apt-get install -y dh-autoreconf
apt-get install -y pkg-config

wget http://selab.janelia.org/software/hmmer3/3.1b2/hmmer-3.1b2.tar.gz
tar -xvzf hmmer-3.1b2.tar.gz
pushd hmmer-3.1b2

./configure --prefix=$target
make
make check
make install
popd

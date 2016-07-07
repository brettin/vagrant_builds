#!/usr/bin/env bash

target=${TARGET-/usr/local}

if [[ $# -ne 0 ]] ; then
        target=$1
        shift
fi


apt-get update
apt-get install -y git
apt-get install -y build-essential
apt-get install -y dh-autoreconf
apt-get install -y pkg-config
apt-get install -y python-setuptools
apt-get -y install python-numpy python-scipy python-dev python-pip python-nose g++ libopenblas-dev
apt-get install -y git python-setuptools python-dev cython libhdf5-serial-dev
apt-get install -y python-tk
apt-get install -y r-base-core

apt-get install -y libpng-dev
apt-get install -y zlib1g-dev
apt-get install -y libfreetype6-dev


git clone https://github.com/arq5x/poretools
cd poretools
python setup.py install



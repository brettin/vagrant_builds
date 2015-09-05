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
apt-get install -y dh-autoreconf
apt-get install -y pkg-config

mkdir -p $target/bin
mkdir -p $target/lib
mkdir -p $target/include

git clone https://github.com/lh3/seqtk.git
pushd seqtk 
make
cp seqtk $target/bin
popd

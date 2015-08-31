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


git clone https://github.com/mlafave/sam2pairwise
pushd sam2pairwise
pushd src
make
mkdir -p $target/bin
cp sam2pairwise $target/bin/

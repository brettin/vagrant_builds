#!/usr/bin/env bash

# build script for bamtools

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
apt-get install -y libboost-all-dev

mkdir -p $target/bin/

wget https://github.com/bbuchfink/diamond/releases/download/v0.7.9/diamond-linux64.tar.gz
tar -xvzf diamond-linux64.tar.gz
cp diamond $target/bin/


#!/usr/bin/env bash

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


wget https://ccb.jhu.edu/software/glimmer/glimmer302b.tar.gz
tar -xvzf glimmer302b.tar.gz
cd glimmer3.02/
cd src/
make
cd ..
mkdir -p $target/bin
cp -i bin/* $target/bin

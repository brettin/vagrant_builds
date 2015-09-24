#!/usr/bin/env bash

# set up for vsearch 

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

apt-get install -y g++ 
apt-get install -y libssl-dev
apt-get install -y zlib1g-dev

git clone https://github.com/statgen/libStatGen.git
git clone https://github.com/statgen/fastQValidator.git

pushd libStatGen
make
make test
popd

pushd fastQValidator 
make -f Makefile

# make install
mkdir -p $target/bin
/bin/cp -i bin/fastQValidator $target/bin
 
popd

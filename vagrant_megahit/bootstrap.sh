#!/usr/bin/env bash

# set up for freebayes 

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

# git clone --recursive git://github.com/ekg/freebayes.git
git clone https://github.com/voutcn/megahit.git
cd megahit
make
# ./megahit -1 pe_1.fq.gz -2 pe_2.fq.gz -o megahit_out

mkdir -p $target/bin
cp megahit* $target/bin/


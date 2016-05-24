#!/usr/bin/env bash

target=${TARGET-/usr/local}

if [[ $# -ne 0 ]] ; then
        target=$1
        shift
fi


apt-get update
apt-get install git
apt-get install -y build-essential
apt-get install -y dh-autoreconf
apt-get install -y pkg-config

apt-get install -y zlib1g-dev

wget https://www.ebi.ac.uk/~zerbino/velvet/velvet_1.2.10.tgz
tar -xvzf velvet_1.2.10.tgz
cd velvet_1.2.10
make

mkdir -p $target/bin
cp velvet* $target/bin

cd ..


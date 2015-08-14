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
apt-get install -y unzip

wget https://github.com/hyattpd/Prodigal/archive/v2.6.1.zip
unzip v2.6.1.zip

mkdir -p $target/bin

pushd Prodigal-2.6.1
make install INSTALLDIR=$target/bin
popd


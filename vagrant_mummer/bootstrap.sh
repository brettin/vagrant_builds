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


wget -O latest.tar.gz  https://sourceforge.net/projects/mummer/files/latest/download?source=files
tar -xvzf latest.tar.gz 
mkdir -p $target
cd MUMmer3.23/
make check
make install

      
cd ..

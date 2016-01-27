#!/usr/bin/env bash

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

apt-get install -y libx11-dev
apt-get install -y libpng-dev
apt-get install -y gnuplot

apt-get install -y cpanminus
cpanm install Tk


wget http://mblab.wustl.edu/software/download/eval-2.2.8.tar.gz
tar -xvzf eval-2.2.8.tar.gz

pushd eval-2.2.8

popd

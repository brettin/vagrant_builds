#!/usr/bin/env bash

# set up for gnko

apt-get update
apt-get install -y build-essential
apt-get install -y git
apt-get install -y cmake
apt-get install -y libncurses5-dev
apt-get install -y libncurses5
apt-get install -y dh-autoreconf
apt-get install -y pkg-config

git clone https://github.com/ekg/ogap.git
pushd ogap
git submodule init
git submodule update
make
cp ogap /usr/local/bin/
popd

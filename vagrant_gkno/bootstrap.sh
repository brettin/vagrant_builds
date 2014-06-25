#!/usr/bin/env bash

# set up for gnko

apt-get update
apt-get install -y build-essential
apt-get install -y openjdk-7-jdk
apt-get install -y ant
apt-get install -y git
apt-get install -y cmake
apt-get install -y ruby1.9.1
apt-get install -y libncurses5-dev
apt-get install -y libncurses5
apt-get install -y dh-autoreconf
apt-get install -y pkg-config


git clone https://github.com/gkno/gkno_launcher.git
pushd gkno_launcher
./gkno build
popd


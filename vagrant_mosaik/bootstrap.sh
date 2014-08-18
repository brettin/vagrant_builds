#!/usr/bin/env bash

# set up for gnko

apt-get update
apt-get install -y build-essential
apt-get install -y cmake
apt-get install -y libncurses5-dev
apt-get install -y libncurses5
apt-get install -y dh-autoreconf
apt-get install -y pkg-config


wget -q -o wget.log https://mosaik-aligner.googlecode.com/files/MOSAIK-2.2.3-Linux-x64.tar
tar -xvf MOSAIK-2.2.3-Linux-x64.tar
cp MOSAIK-2.2.3-Linux-x64/Mosaik* /usr/local/bin

# need bamtools to properly prepare bam files for traing neural net.
# need to install Mosaik from source to get codes necessary for training
# neural net.

# copy the pre-built neural nets to usr/local/bin
git clone https://github.com/wanpinglee/MOSAIK.git
cd MOSAIK
cp src/networkFile/*.ann /usr/local/bin
 
# use this if we want to install the code to train a new neural net.
# cd src/networkFile/retrainCode
# make
# cp attachXC/xc_pe attachXC/xc_se /usr/local/bin/
# cp trainNetwork/train_mq /usr/local/bin/
# 
# cd ../../..


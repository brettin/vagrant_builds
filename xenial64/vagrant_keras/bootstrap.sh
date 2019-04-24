#!/usr/bin/env bash

target=${TARGET-/usr/local}

if [[ $# -ne 0 ]] ; then
        target=$1
        shift
fi


apt-get update
apt-get install -y git
apt-get install -y build-essential
apt-get install -y dh-autoreconf
apt-get install -y pkg-config


wget https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh
chmod u+x Anaconda3-2019.03-Linux-x86_64.sh


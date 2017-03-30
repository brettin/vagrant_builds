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

git clone https://github.com/brettin/ml_tutorials


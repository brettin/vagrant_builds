#!/usr/bin/env bash

# installer for bwa

target=${TARGET-/usr/local}

if [[ $# -ne 0 ]] ; then
        target=$1
        shift
fi


apt-get update
apt-get install -y build-essential
apt-get install -y git
apt-get install -y libncurses5-dev
apt-get install -y libncurses5
apt-get install -y dh-autoreconf
apt-get install -y pkg-config

git clone https://github.com/BenLangmead/bowtie2
cd bowtie2; make

mkdir -p $target/bin
cp bowtie2* $target/bin/

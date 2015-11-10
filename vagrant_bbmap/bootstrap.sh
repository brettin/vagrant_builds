#!/usr/bin/env bash

target=${TARGET-/usr/local}

if [[ $# -ne 0 ]] ; then
        target=$1
        shift
fi


# set up for java 

apt-get update
apt-get install -y openjdk-7-jdk
apt-get install -y ant
apt-get install unzip

# set up for samtools
apt-get install -y git
apt-get install -y build-essential
apt-get install -y libncurses5-dev

git clone https://github.com/samtools/samtools.git
git clone https://github.com/samtools/htslib.git
pushd samtools
git checkout master
make
make razip
make prefix=$target install
popd


# set up for bbmap

wget http://sourceforge.net/projects/bbmap/files/BBMap_35.66.tar.gz
tar -xvzf BBMap_35.66.tar.gz
pushd bbmap
cp -r * $target/bin
popd

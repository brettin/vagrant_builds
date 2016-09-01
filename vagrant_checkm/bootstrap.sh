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

# apt-get install -y libncurses5-dev
# apt-get install -y libncurses5

apt-get install -y zlib1g-dev
apt-get install -y libboost-all-dev
apt-get install -y g++
apt-get install -y libblas-dev
apt-get install -y libblas-doc
apt-get install -y liblapack-dev
apt-get install -y liblapack-doc
apt-get install -y libatlas-base-dev
apt-get install -y gfortran
apt-get install -y libc6

apt-get install -y python-dev
apt-get install -y python-pip

apt-get install -y freetype*
apt-get install -y libpng-dev
apt-get install -y dvipng

# apt-get install -y ghostscript
# apt-get install -y texlive-full
# apt-get install -y poppler-utils

mkdir -p $target/bin
mkdir -p $target/lib

easy_install -U distribute
pip install numpy
pip install --install-option="--prefix=$target" checkm-genome

$PWD/prodigal-bootstrap.sh
$PWD/hmmr-bootstrap.sh
$PWD/pplacer-bootstrap.sh

exit


# pip install scipy
# pip install matplotlib
# pip install pysam
# pip install dendropy
# pip install ScreamingBackpack


# wget https://github.com/Ecogenomics/CheckM/archive/v1.0.4.tar.gz
# tar -xvzf v1.0.4.tar.gz
# pushd CheckM-1.0.4 
# pip install checkm-genome
# popd

# wget https://github.com/matsen/pplacer/releases/download/v1.1.alpha17/pplacer-Linux-v1.1.alpha17.zip
# unzip pplacer-Linux-v1.1.alpha17.zip
# pushd pplacer-Linux-v1.1.alpha17
# cp guppy pplacer $target/bin
# popd


# wget http://selab.janelia.org/software/hmmer3/3.1b2/hmmer-3.1b2.tar.gz
# tar -xvzf hmmer-3.1b2.tar.gz
# pushd hmmer-3.1b2

# ./configure --prefix=$target
# make
# make check
# make install
# popd

# wget https://github.com/hyattpd/Prodigal/archive/v2.6.1.zip
# unzip v2.6.1.zip
# pushd Prodigal-2.6.1
# make install INSTALLDIR=$target/bin
# popd



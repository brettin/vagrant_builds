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
apt-get install -y unzip


apt-get install -y cpanminus
cpanm install JSON File::Temp
cpanm install Math::Trig
cpanm install File::Basename

apt-get install -y gnuplot

mkdir -p $target/bin

wget http://evolution.gs.washington.edu/phylip/download/phylip-3.696.tar.gz
tar -xzvf phylip-3.696.tar.gz
pushd phylip-3.696/src
cp Makefile.unx Makefile
make install
cp -r ../exe/* $target/bin
ln -s /usr/local/bin/font1 /usr/local/bin/fontfile
popd

wget http://www.atgc-montpellier.fr/download/binaries/bionj/BIONJ.tar.gz
tar -xzvf BIONJ.tar.gz
cp BIONJ_linux /usr/bin/BIONJ-LINUX
ln -s /usr/bin/BIONJ-LINUX /usr/local/bin/BIONJ-LINUX
chmod a+x /usr/bin/BIONJ-LINUX 

wget http://sourceforge.net/projects/crass/files/crAss_v2.1.zip
unzip crAss_v2.1.zip
pushd crAss_v2.1
mkdir -p $target/bin
cp crAss.pl $target/bin
chmod a+rx $target/bin/crAss.pl

#!/usr/bin/env bash

# set up for vsearch 

# build script for bamtools

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

apt-get install -y libcairo2-dev libjpeg8-dev libpango1.0-dev libgif-dev build-essential g++
apt-get install -y cpanminus

cpanm install JSON
cpanm install Cairo
cpanm install Exception::Class
cpanm install Test::Warn
cpanm install Test::Exception
cpanm install Test
cpanm install Test::Differences
cpanm install Test::Tester
cpanm install Test::NoWarnings
cpanm install Test::Deep
cpanm install Test::Most
cpanm install Statistics::PCA

wget http://sourceforge.net/projects/prinseq/files/standalone/prinseq-lite-0.20.4.tar.gz
tar -xvzf prinseq-lite-0.20.4.tar.gz
pushd prinseq-lite-0.20.4

# make install
mkdir -p $target/bin
/bin/cp -i prinseq-lite.pl  $target/bin
/bin/cp -i prinseq-graphs.pl  $target/bin
/bin/cp -i prinseq-graphs-noPCA.pl  $target/bin
 
popd

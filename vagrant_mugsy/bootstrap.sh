#!/usr/bin/env bash

# build script for mugsy

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
apt-get install -y perl-doc
apt-get install -y gnuplot-nox

# mugsy specific stuff

tarball=mugsy_x86-64-v1r2.3.tgz
mugsydir=mugsy_x86-64-v1r2.3

if [ -e ./$tarball ] ; then
  echo "using existing tarball"
else
  echo "downloading $tarball"
  wget http://sourceforge.net/projects/mugsy/files/$tarball
fi

tar xvzf $tarball
pushd $mugsydir

export MUGSY_INSTALL=$target/$mugsydir
perl -i.bak -p -e 's/MUGSY_INSTALL=.*/MUGSY_INSTALL=$ENV{MUGSY_INSTALL}/' mugsyenv.sh 

popd
cp -r $mugsydir $target/
cp $mugsydir/mugsyenv.sh /etc/profile.d/

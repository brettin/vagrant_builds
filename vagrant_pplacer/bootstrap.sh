#!/usr/bin/env bash

# build script for pplacer 

target=${TARGET-/usr/local}

if [[ $# -ne 0 ]] ; then
        target=$1
        shift
fi


apt-get update
apt-get install -y build-essential
apt-get install -y cmake
apt-get install -y libncurses5-dev
apt-get install -y libncurses5
apt-get install -y dh-autoreconf
apt-get install -y pkg-config

apt-get install -y unzip

wget https://github.com/matsen/pplacer/releases/download/v1.1.alpha18/pplacer-linux-v1.1.alpha18-2-gcb55169.zip
unzip pplacer-linux-v1.1.alpha18-2-gcb55169.zip

mkdir -p $target/bin/
cp pplacer-*/guppy pplacer-*/pplacer pplacer-*/rppr $target/bin/


# test the install, just running a few cmds
pushd /vagrant/
wget http://github.com/fhcrc/microbiome-demo/zipball/master -O test-data.zip
unzip test-data.zip
TESTDIR=fhcrc-microbiome-demo-730d268

pushd $TESTDIR
set -o verbose
set -e

pplacer -c vaginal_16s.refpkg src/p4z1r36.fasta
guppy fat -c vaginal_16s.refpkg p4z1r36.jplace
guppy kr src/*.jplace
guppy kr_heat -c vaginal_16s.refpkg/ src/p1z1r2.jplace src/p1z1r34.jplace

popd

# support for visualizing the resulting tree, will require java and xdisplay
# wget https://googledrive.com/host/0BxMokdxOh-JRM1d2azFoRnF3bGM/download/forester_1038.jar
# java -cp $PWD/forester_1038.jar org.forester.archaeopteryx.Archaeopteryx p4z1r36.xml

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

apt-get install -y mpich2
apt-get install -y libmpich2-dev

git clone https://github.com/GeneAssembly/kiki.git

cd kiki
mkdir bin
cd bin
cmake ..
make ki
./ki -i ../test/short.fa -o test
cat test.contig* | ../scripts/tab2fa.pl >test.fa 

mkdir -p $target/bin
cp ki $target/bin/


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

git clone https://github.com/lh3/bwa.git
cd bwa; make

mkdir -p $target/bin
mkdir -p $target/site
mkdir -p $target/lib
mkdir -p $target/man/man1

cp bwa $target/bin
cp bwa.1 $target/man/man1
cp bwa-helper.js $target/site
cp bwa-postalt.js $target/site
cp libbwa.a $target/lib
cp qualfa2fq.pl $target/bin
cp xa2multi.pl $target/bin

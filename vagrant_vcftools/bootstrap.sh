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
apt-get install -y dh-autoreconf
apt-get install -y pkg-config

mkdir -p $target/bin
mkdir -p $target/site
mkdir -p $target/lib
mkdir -p $target/man/man1

wget -q -o wget.log http://sourceforge.net/projects/vcftools/files/vcftools_0.1.12b.tar.gz
gunzip vcftools_0.1.12b.tar.gz
tar -xvf vcftools_0.1.12b.tar

pushd vcftools_0.1.12b

make PREFIX=$target

find . -name "*.pm" -exec cp {} /usr/lib/perl5/ \;

popd

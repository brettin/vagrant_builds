#!/usr/bin/env bash

target=${TARGET-/usr/local}

if [[ $# -ne 0 ]] ; then
        target=$1
        shift
fi

apt-get update
apt-get install -y openjdk-7-jdk
apt-get install -y ant
apt-get install unzip

wget http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.3.zip
unzip fastqc_v0.11.3.zip

cp -rip FastQC $target/
chmod a+rx $target/FastQC/fastqc
ln -s $target/FastQC/fastqc $target/bin/fastqc


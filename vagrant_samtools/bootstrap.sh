#!/usr/bin/env bash

# set up for gnko

apt-get update
apt-get install -y build-essential
apt-get install -y openjdk-7-jdk
apt-get install -y ant
apt-get install -y git
apt-get install -y cmake
apt-get install -y ruby1.9.1
apt-get install -y libncurses5-dev
apt-get install -y libncurses5
apt-get install -y dh-autoreconf
apt-get install -y pkg-config

# download samtools and place in the current working directory
# because I'm on a plane, I can't do this right now.

git clone https://github.com/samtools/samtools.git
git clone https://github.com/samtools/htslib.git

# compile the source
cd samtools/
git checkout master
make
make razip

perl -e 'use File::Find; find(sub {print "cp $File::Find::dir/$_ /usr/local/bin/ \n" if -x and !-d and $File::Find::dir !~ /\.git/}, ".")' > cp.src
source cp.src

# deploy man page
cp samtools.1 /usr/share/man/man1/

#!/usr/bin/env bash

# set up for gnko

apt-get update
apt-get install -y build-essential
apt-get install -y git
apt-get install -y libncurses5-dev
apt-get install -y libncurses5
apt-get install -y dh-autoreconf
apt-get install -y pkg-config


apt-get install -y python-pip
apt-get install -y python-dev
apt-get install -y libblas-dev
apt-get install -y liblapack-dev
apt-get install -y liblapack3gf
apt-get install -y gfortran
pip install numpy
pip install scipy

# Added these on Apr. 21, 2018
apt-get install libbz2-dev
apt-get install -y lzma
apt-get install -y liblzma-dev
apt-get install -y libtbb-dev

git clone https://github.com/samtools/htslib.git
wget https://sourceforge.net/projects/samtools/files/samtools/0.1.18/samtools-0.1.18.tar.bz2
bzip2 -d samtools-0.1.18.tar.bz2 
tar -xvf samtools-0.1.18.tar

cd samtools*/
make
cd ..

cd htslib*
make
cd ..

perl -e 'use File::Find; find(sub {print "cp $File::Find::dir/$_ /usr/local/samtools-0.1.18/bin/ \n" if -x and !-d and $File::Find::dir !~ /\.git/}, ".")' > cp.src
mkdir -p /usr/local/samtools-0.1.18/bin
source cp.src


git clone https://github.com/BenLangmead/bowtie2
cd bowtie2
make
mkdir -p $target/bin
cp bowtie2* $target/bin/
cd ..


git clone https://github.com/katholt/srst2
pip install srst2/

echo "export PATH=/usr/local/samtools-0.1.18/bin/lib:$PATH" >> ~/srst2.profile

srst2 --version
getmlst.py -h
slurm_srst2.py -h


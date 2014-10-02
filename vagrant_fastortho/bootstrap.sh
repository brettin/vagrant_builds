#!/usr/bin/env bash

apt-get update
apt-get -y install wget
apt-get install unzip
apt-get install make
apt-get install -y build-essential
apt-get install -y ubuntu-desktop
apt-get install -y openjdk-7-jdk

apt-get install -y blast2
apt-get install ncbi-blast+

wget -q http://brcdownloads.patricbrc.org/patric2/software/FastOrtho/FastOrtho.zip
unzip FastOrtho.zip

pushd FastOrtho/src

sed -i.bak s/LDFLAGS=/#LDFLAGS=/ Makefile
make
cp FastOrtho /usr/local/bin

popd
pushd FastOrtho

n=SetFast.jar
p=$(basename $n .jar)
echo $n
echo $p
mkdir -p /usr/local/lib/jars
cp $n /usr/local/lib/jars/
echo "\"/usr/bin/java\" \"-jar\" \"/usr/local/lib/jars/$n\" \"\$@\"" > /usr/local/bin/$p.sh
chmod a+rx /usr/local/bin/$p.sh

popd

wget -q http://micans.org/mcl/src/mcl-latest.tar.gz
gunzip mcl-latest.tar.gz
tar -xvf mcl-latest.tar

pushd mcl*

./configure --prefix=/usr/local
make install

popd



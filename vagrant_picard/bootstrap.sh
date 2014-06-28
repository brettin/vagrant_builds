#!/usr/bin/env bash

# set up for java 

apt-get update
apt-get install -y openjdk-7-jdk
apt-get install -y ant
apt-get install unzip

wget http://downloads.sourceforge.net/project/picard/picard-tools/1.115/picard-tools-1.115.zip
unzip picard-tools-1.115.zip

pushd picard-tools-1.115

for n in *.jar ; do 
  p=$(basename $n .jar) ; 
  echo "/usr/bin/java -jar /usr/local/jars/picard-1.115/$n " > /usr/local/bin/$p.sh ;
  chmod a+rx /usr/local/bin/$p.sh ;
done


mkdir -p /usr/local/jars/picard-1.115
chmod -R a+rx /usr/local/jars

cp * /usr/local/jars/picard-1.115
chmod a+r /usr/local/jars/picard-1.115/*

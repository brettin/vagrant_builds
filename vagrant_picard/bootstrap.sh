#!/usr/bin/env bash

# set up for gnko

apt-get update
apt-get install -y openjdk-7-jdk
apt-get install -y ant
apt-get install unzip

wget http://downloads.sourceforge.net/project/picard/picard-tools/1.115/picard-tools-1.115.zip
unzip picard-tools-1.115.zip


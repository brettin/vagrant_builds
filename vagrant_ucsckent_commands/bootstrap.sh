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

apt-get install -y libpng-dev
apt-get install -y dvipng

export DEBIAN_FRONTEND=noninteractive
sudo -E apt-get -q -y install mysql-server

apt-get install -y mysql-client
apt-get install -y libssl
apt-get install -y libssl-dev
apt-get install -y libmysqlclient-dev

wget ftp://hgdownload.cse.ucsc.edu/apache/htdocs/admin/exe/userApps.src.tgz
tar xvzf userApps.src.tgz
cd userApps
make
./bin/twoBitToFa 


mkdir -p $target/bin
cp * $target/bin


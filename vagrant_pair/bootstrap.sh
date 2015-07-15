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

apt-get install -y autoconf 
apt-get install -y automake 
apt-get install -y libtool

git clone https://github.com/xflouris/PEAR.git
cd PEAR
./autogen.sh

# --disable-zlib on precise because version is to old

if [ "$target" == "/usr/local" ] ; then
  echo "installing into /usr/local"
  echo "disabling zlib"
  ./configure --disable-zlib
else 
  echo "installing into $target"
  echo "disabling zlib"
  ./configure --disable-zlib --prefix=$target
fi

make
make install

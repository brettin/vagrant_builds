#!/usr/bin/env bash

target=${TARGET-/usr/local}

if [[ $# -ne 0 ]] ; then
        target=$1
        shift
fi

apt-get update
apt-get -y install software-properties-common
apt-get -y install python-software-properties
add-apt-repository ppa:ubuntu-toolchain-r/test
apt-get update

apt-get install -y git
apt-get install -y dh-autoreconf

apt-get -y install gcc-4.8
apt-get -y install g++-4.8
apt-get -y install make

# needed if gcc is already installed
update-alternatives --remove-all gcc 
update-alternatives --remove-all g++


update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 20
update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 20
update-alternatives --config gcc
update-alternatives --config g++

apt-get install -y zlib1g-dev
apt-get install -y libgsl0ldbl
apt-get install -y gsl-bin libgsl0-dev

# doesn't work on precise
# apt-get install -y capnproto

wget https://capnproto.org/capnproto-c++-0.5.3.tar.gz
tar zxf capnproto-c++-0.5.3.tar.gz

cd capnproto-c++-0.5.3

export CCFLAGS='-std=c++11'
./configure 
make -j6 check
sudo make install

cd ..


git clone https://github.com/marbl/Mash.git
pushd Mash

./bootstrap.sh
./configure --prefix $target
make
make install

popd

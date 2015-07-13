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
apt-get install -y gfortran

wget https://github.com/mothur/mothur/archive/v1.35.1.tar.gz
tar -xzvf v1.35.1.tar.gz 
pushd mothur-1.35.1/
pushd source

# edit the makefile
cp makefile makefile.bak
perl -lne 's/TARGET_ARCH \+= -arch x86_64/#TARGET_ARCH \+= -arch x86_64/; \
           s/#CXXFLAGS \+= -mtune=native -march=native/CXXFLAGS \+= -mtune=native -march=native/; \
           print; ' < makefile > makefile.new
mv makefile.new makefile
# done edit the makefile

make

#./mothur
make install

popd
popd

mv mothur-1.35.1 $target/
ln -s $target/mothur-1.35.1/mothur $target/bin/mothur
ln -s $target/mothur-1.35.1/uchime $target/bin/uchime


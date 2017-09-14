#!/usr/bin/env bash

target=${TARGET-/usr/local}

if [[ $# -ne 0 ]] ; then
        target=$1
        shift
fi

target=/usr/local/cdd-hit

apt-get update
apt-get install -y build-essential
apt-get install -y libx11-dev

wget https://github.com/weizhongli/cdhit/releases/download/V4.6.8/cd-hit-v4.6.8-2017-0621-source.tar.gz
tar -xvzf cd-hit-v4.6.8-2017-0621-source.tar.gz 

mkdir -p $target/bin

cd cd-hit-v4.6.8-2017-0621

make PREFIX=$target
make PREFIX=$target/bin install

cd cd-hit-auxtools
make
cp cd-* read-linker $target/bin

cd ../..


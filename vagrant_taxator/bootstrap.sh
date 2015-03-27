#!/usr/bin/env bash

target=${TARGET-/usr/local}

if [[ $# -ne 0 ]] ; then
        target=$1
        shift
fi

apt-get update


# This stuff needs to be fixed

datapath="/vagrant"
installpath=$target

# download the software
cp /vagrant/taxator-tk_1.2.2-extended-64bit.tar.bz2 .

# install the software
mkdir -p $installpath
mkdir -p $datapath
tar -C $installpath -xjf taxator-tk_1.2.2-extended-64bit.tar.bz2

# download the databases
# "$installpath"/taxator-tk_1.2.2-extended-64bit/download-refpack.sh "$datapath"
# cp -r /vagrant/nonredundant-microbial_20121122 $datapath

"$installpath"/taxator-tk_1.2.2-extended-64bit/index-blast.sh "$datapath"/nonredundant-microbial_20121122

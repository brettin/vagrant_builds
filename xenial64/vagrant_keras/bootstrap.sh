#!/usr/bin/env bash

target=${TARGET-/usr/local}

if [[ $# -ne 0 ]] ; then
        target=$1
        shift
fi


apt-get update
apt-get install -y git
apt-get install -y build-essential
apt-get install -y dh-autoreconf
apt-get install -y pkg-config


miniconda=Miniconda3-latest-Linux-x86_64.sh
wget http://repo.continuum.io/miniconda/$miniconda
chmod +x $miniconda
./$miniconda -b -p /opt/anaconda

cat >> /home/vagrant/.bashrc << END
# add for anaconda install
PATH=/opt/anaconda/bin:\$PATH
END

cat >> /root/.bashrc << END
# add for anaconda install
PATH=/opt/anaconda/bin:\$PATH
END

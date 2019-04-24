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

export PATH=$PATH:/opt/anaconda/bin

conda create -n candle -y python=3.7
source activate candle
# Install additonal modules not shipped with Anaconda
conda install -y -c conda-forge tensorflow
conda install -y -c anaconda hdf5=1.8.17
conda install -y -c anaconda theano
conda install -y -c conda-forge keras=2
conda install -y -c anaconda pandas
conda install -y -c anaconda scikit-learn 
conda install -y -c anaconda matplotlib
conda install -y -c conda-forge pygpu
conda install -y -c conda-forge tqdm

# Download the source files for the benchmarks
git clone https://github.com/ECP-Candle/benchmarks


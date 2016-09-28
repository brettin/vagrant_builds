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


apt-get install -y python-numpy 
apt-get install -y python-scipy
apt-get install -y python-dev
apt-get install -y python-pip
apt-get install -y python-nose
apt-get install -y g++
apt-get install -y libopenblas-dev
apt-get install -y libfreetype6-dev

pip install Theano
pip install pandas
pip install matplotlib
pip install sklearn # not absolutely required

# python -c "import numpy; numpy.test()"
# python -c "import scipy; scipy.test()"
# python -c "import theano; theano.test()"
# python `python -c "import os, theano; print os.path.dirname(theano.__file__)"`/misc/check_blas.py

git clone https://github.com/fchollet/keras.git
cd keras
git checkout master
python setup.py install



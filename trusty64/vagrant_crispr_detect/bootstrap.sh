#!/usr/bin/env bash

# build script for bamtools

target=${TARGET-/usr/local}

if [[ $# -ne 0 ]] ; then
        target=$1
        shift
fi


apt-get update
apt-get install -y build-essential
apt-get install -y unzip


cpan install Parallel::ForkManager




mkdir -p $target/bin/



./cdd-hit.sh $target
./clustalw2.sh $target
./emboss.sh $target
./rnafold.sh $target
# ./blast.sh $target

wget http://brownlabtools.otago.ac.nz/CRISPRDetect/CRISPRDetect_v2.2.zip
unzip CRISPRDetect_v2.2.zip



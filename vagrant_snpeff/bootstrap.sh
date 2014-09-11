#!/usr/bin/env bash

# set up for snpeff 

target=${TARGET-/usr/local}

if [[ $# -ne 0 ]] ; then
        target=$1
        shift
fi

dst=$target/data

apt-get update
apt-get install -y openjdk-7-jdk
apt-get install -y ant
apt-get install unzip

wget http://sourceforge.net/projects/snpeff/files/snpEff_latest_core.zip
unzip snpEff_latest_core.zip

cat > $target <<EOF
#---
# Databases are stored here
# E.g.: Information for 'hg19' is stored in data_dir/hg19/
#
# You can use tilde ('~') as first character to refer to your home directory. 
# Also, a non-absolute path will be relative to config's file dir
# 
#---
data.dir = $dst/data/
EOF



for n in *.jar ; do 
  p=$(basename $n .jar) ; 
  echo "\"/usr/bin/java\" \"-jar\" \"/usr/local/jars/picard-1.115/$n\" \"\$@\"" > /usr/local/bin/$p.sh ;
  chmod a+rx /usr/local/bin/$p.sh ;
done


mkdir -p /usr/local/jars/picard-1.115
chmod -R a+rx /usr/local/jars

cp * /usr/local/jars/picard-1.115
chmod a+r /usr/local/jars/picard-1.115/*

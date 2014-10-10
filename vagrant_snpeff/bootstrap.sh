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

# general steps:
# download latest
# unzip latest
# wrap jars and deploy as scripts?
# configure location of database


wget http://sourceforge.net/projects/snpeff/files/snpEff_latest_core.zip
unzip snpEff_latest_core.zip


cp -r snpEff /usr/local
pushd /usr/local/snpEff

for n in *.jar ; do 
   p=$(basename $n .jar) ; 
   echo "\"/usr/bin/java\" \"-jar\" \"/usr/local/snpEff/$n\" \"\$@\"" > /usr/local/bin/$p.sh ;
   chmod a+rx /usr/local/bin/$p.sh ;
done

popd

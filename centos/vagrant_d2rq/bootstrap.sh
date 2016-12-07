#!/usr/bin/env bash
set -e

target=${TARGET-/usr/local}

if [[ $# -ne 0 ]] ; then
	target=$1
	shift
fi

yum install -y git
yum install -y java-1.7.0-openjdk*
yum install -y ant

wget https://github.com/downloads/d2rq/d2rq/d2rq-0.8.1.tar.gz
tar -xzvf d2rq-0.8.1.tar.gz
pushd d2rq-0.8.1

ant
ant jar
popd

cp -r d2rq-0.8.1 /usr/local/
echo 'PATH=$PATH:'$target'/d2rq-0.8.1' >> /etc/bashrc

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


apt-get install -y cpanminus

cpanm install JSON File::Temp
cpanm install Getopt::Long
cpanm install List::Util
cpanm install File::Next
cpanm install Test::Warn
cpanm install File::Slurp
cpanm install PerlIO::gzip
cpanm install File::Which
cpanm install local::lib

apt-get install -y vcftools
apt-get install -y samtools
apt-get install -y tabix
apt-get install -y r-base
apt-get install -y liblapack-dev
apt-get install -y liblapack3gf
apt-get install -y jags

wget http://cran.r-project.org/src/contrib/Archive/plyr/plyr_1.7.1.tar.gz
wget http://cran.r-project.org/src/contrib/Archive/Rcpp/Rcpp_0.9.10.tar.gz
wget http://ftp.ussg.iu.edu/CRAN/src/contrib/rjags_3-15.tar.gz
wget http://ftp.ussg.iu.edu/CRAN/src/contrib/R2jags_0.5-6.tar.gz
wget http://ftp.ussg.iu.edu/CRAN/src/contrib/getopt_1.20.0.tar.gz
wget http://cran.r-project.org/src/contrib/Archive/reshape2/reshape2_1.2.tar.gz
wget http://cran.r-project.org/src/contrib/Archive/coda/coda_0.16-1.tar.gz
wget http://cran.r-project.org/src/contrib/Archive/abind/abind_1.4-0.tar.gz
wget http://cran.r-project.org/src/contrib/Archive/R2WinBUGS/R2WinBUGS_2.1-19.tar.gz
wget http://cran.r-project.org/src/contrib/Archive/stringr/stringr_0.6.2.tar.gz

R CMD INSTALL plyr_1.7.1.tar.gz
R CMD INSTALL Rcpp_0.9.10.tar.gz
R CMD INSTALL coda_0.16-1.tar.gz
R CMD INSTALL rjags_3-15.tar.gz
R CMD INSTALL abind_1.4-0.tar.gz 
R CMD INSTALL R2WinBUGS_2.1-19.tar.gz 
R CMD INSTALL R2jags_0.5-6.tar.gz
R CMD INSTALL getopt_1.20.0.tar.gz
R CMD INSTALL stringr_0.6.2.tar.gz 
R CMD INSTALL reshape2_1.2.tar.gz


git clone https://bitbucket.org/jtr4v/baysic.git
cd baysic
./run_tests.sh

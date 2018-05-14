#!/usr/bin/env bash

# build script for bamtools

target=${TARGET-/usr/local}

if [[ $# -ne 0 ]] ; then
        target=$1
        shift
fi


apt-get update
apt-get install -y build-essential
apt-get install -y git
apt-get install -y ncurses-devel
apt-get install -y unzip
apt-get install -y libexpat1-dev libssl-dev libmysqlclient-dev libxml2-dev

mkdir -p $target

# Create a folder where you want to install different Perls, and cd into it:
# Note that it doesn't need to be your home folder. Put it wherever you want to maintain such software:
export PERL_BASE="$HOME/perl"
mkdir -p $PERL_BASE
cd $PERL_BASE

# Download source tarball into a subfolder named src, and untar:
curl --create-dirs -L -o src/perl-5.22.2.tar.gz http://www.cpan.org/src/5.0/perl-5.22.2.tar.gz
cd src
tar -zxf perl-5.22.2.tar.gz

# Configure and build, making sure that this non-standard location is baked into the perl binary:
cd perl-5.22.2
./Configure -des -Dprefix=$PERL_BASE/perl-5.22.2 -Dotherlibdirs=$PERL_BASE/perl-5.22.2/lib/perl5
make
make install

# Install dependencies for Ensembl API, VEP, OncoKB, and other tools we use here at MSKCC:
curl -sL https://cpanmin.us | $PERL_BASE/perl-5.22.2/bin/perl - --notest -l $PERL_BASE/perl-5.22.2 App::cpanminus JSON JSON::Parse XML::Parser XML::Simple LWP LWP::Simple LWP::Protocol::https Archive::Extract Archive::Tar Archive::Zip CGI DBI Time::HiRes DBD::mysql Set::IntervalTree PerlIO::gzip Encode File::Copy::Recursive Perl::OSType Module::Metadata Statistics::Lite Tie::Autotie Tie::IxHash Log::Log4perl FindBin::Real Getopt::Long Catalyst::Runtime Catalyst::Devel List::Util Test::XML::Simple Test::XPath IO::String Bio::Perl version

# Set $PERL5LIB to find these libraries, and set $PATH to use this Perl instead of the system Perl:
export PERL5LIB="$PERL_BASE/perl-5.22.2/lib/perl5:$PERL_BASE/perl-5.22.2/lib/perl5/x86_64-linux:$PERL5LIB"
export PATH="$PERL_BASE/perl-5.22.2/bin:$PATH"

# You can add those 2 lines to the end of your `~/.bashrc` to make it persistent.
# But be sure to define `$PERL_BASE` in your `~/.bashrc` too.

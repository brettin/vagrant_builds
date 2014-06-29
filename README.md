vagrant_builds
==============

Contains a set of vagrant builds for various bioinformatics tools.


Vagrant is a tool that can be used to quickly configure a machine
with a tool or set of tools and their dependencies. We provide here
a set of vagrant builds. These build  contain commonly used
bioinformatics tools for genome analysis. Genome analysis spans the
range from reads to complex analyses in both the evolution ary and
metabololic modeling domains

There are many ways to use these vagrant builds. You can download
vagrant, crate a directory, and copy the Vagrant file and the
bootstrap file into a directory. From that directory, simply run
vagrant up and you will have a running machine instance with the
particular bioinformatics tool installed. 

On a mac, Virtual Box is required for vagrant to function.

Alternatively, the bootstrap.sh script in each vagrant build can be
used to configure and install the particular bioinformatics tool.

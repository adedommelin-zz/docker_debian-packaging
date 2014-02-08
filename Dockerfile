FROM debian:sid 
MAINTAINER Alexandre De Dommelin "adedommelin@tuxz.net" 

# Add needed devel tools/packages 
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y devscripts vim-nox git subversion debhelper dh-make-perl wget zip 

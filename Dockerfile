FROM debian:sid
MAINTAINER Alexandre De Dommelin "adedommelin@tuxz.net"


ENV DEBIAN_FRONTEND noninteractive

# Add needed devel tools/packages
RUN apt-get update
RUN apt-get install -y devscripts vim-nox git subversion debhelper dh-make-perl wget zip

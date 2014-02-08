FROM debian:sid 
MAINTAINER Alexandre De Dommelin "adedommelin@tuxz.net" 

# Add needed devel tools/packages 
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y devscripts vim-nox git subversion debhelper dh-make-perl 

#------------------------------------------------------------------------------
# ssh / user config
#------------------------------------------------------------------------------
# Set root password
RUN echo 'root:root' | chpasswd

# Install openssh-server 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y openssh-server
RUN sed -ri 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config

RUN mkdir /root/.ssh && chmod 700 /root/.ssh
ADD id_rsa.pub /root/.ssh/authorized_keys
RUN chmod 400 /root/.ssh/authorized_keys && chown root:root /root/.ssh/authorized_keys
RUN mkdir -p /var/run/sshd


# Expose ssh port 
EXPOSE 22 
ENTRYPOINT ["/usr/sbin/sshd", "-D"]

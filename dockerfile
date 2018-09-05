# Set the base image
FROM debian:stable-slim

# Dockerfile author / maintainer 
MAINTAINER Name <oyiekeallen@gmail.com> 

ENV DEBIAN_FRONTEND noninteractive

# setup workdir
RUN mkdir -p /root/work/
WORKDIR /root/work/

# install git
RUN apt-get -y update && apt-get -y install git

# Update application repository list and install git-ftp
RUN apt-get update && sudo apt-get -qq  install git-ftp

# slim down image
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/man/?? /usr/share/man/??_*

# run a CMD to show git is installed
CMD git help

#!/bin/bash

docker_user=$1

apt-get install -y apt-transport-https ca-certificates curl software-properties-common && \
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \

# We could verify that we have the fingerprint
#     9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88
# by running
#     apt-key fingerprint 0EBFCD88

# Using bionic for cosmic because there's no version for cosmic available atm
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   bionic \
   stable" && \
apt-get update && \
apt-get install -y docker-ce && \
service docker start #&& \
#usermod -aG docker ${docker_user}

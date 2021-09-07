#!/bin/bash

# Installation of Hashicorp Vault. As it happens after 770-as-root-install-terraform.bash it doesn't really need
# to re-add Hashicorp's key and repository
wget -O- https://apt.releases.hashicorp.com/gpg | apt-key add - && \
apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
apt update && \
apt install -y vault


#!/bin/bash

wget -O- https://apt.releases.hashicorp.com/gpg | apt-key add - && \
apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
apt update && \
apt install -y terraform


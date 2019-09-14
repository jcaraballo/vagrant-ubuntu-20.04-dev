#!/bin/bash

curl -sSL https://get.docker.com/rootless | sh

echo 'export PATH=/home/vagrant/bin:$PATH' >> $HOME/.bashrc
echo 'export DOCKER_HOST=unix:///run/user/1000/docker.sock' >> $HOME/.bashrc


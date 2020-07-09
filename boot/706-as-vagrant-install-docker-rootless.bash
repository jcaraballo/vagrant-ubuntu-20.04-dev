#!/bin/bash

curl -sSL https://get.docker.com/rootless | sh

echo "export PATH=$HOME/bin:"'$PATH' >> $HOME/.bashrc
echo "export PATH=/sbin:"'$PATH' >> $HOME/.bashrc
echo 'export DOCKER_HOST=unix:///run/user/1001/docker.sock' >> $HOME/.bashrc


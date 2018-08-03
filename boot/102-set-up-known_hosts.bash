#!/bin/bash

mkdir -p ~/.ssh

for i in $@ ; do
  ssh-keyscan $i >> ~/.ssh/known_hosts
done


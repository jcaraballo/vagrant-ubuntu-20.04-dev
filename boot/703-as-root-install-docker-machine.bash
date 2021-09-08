#!/bin/bash

docker_machine_version=$1

echo "Installing Docker Machine version $docker_machine_version"
curl -fsSL https://github.com/docker/machine/releases/download/v${docker_machine_version}/docker-machine-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-machine && chmod 755 /usr/local/bin/docker-machine

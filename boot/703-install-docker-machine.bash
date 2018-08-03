#!/bin/bash

docker_machine_version=$1

echo "Installing Docker Machine version $docker_machine_version"
curl -fsSL https://github.com/docker/machine/releases/download/v${docker_machine_version}/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine && \
install /tmp/docker-machine /usr/local/bin/docker-machine

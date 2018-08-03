#!/bin/bash

docker_composer_version=$1

echo "Installing Docker Compose version $docker_composer_version"
curl -fsSL https://github.com/docker/compose/releases/download/${docker_composer_version}/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose && \
chmod +x /usr/local/bin/docker-compose

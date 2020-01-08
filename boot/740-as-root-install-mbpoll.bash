#!/bin/bash

wget -O- http://www.piduino.org/piduino-key.asc | apt-key add - && \
add-apt-repository 'deb http://apt.piduino.org stretch piduino' && \
apt-get update && \
apt-get install -y mbpoll


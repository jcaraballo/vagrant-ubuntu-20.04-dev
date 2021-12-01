#!/usr/bin/env bash

tmp=${1:-`mktemp -d`}
executable="${tmp}/install.sh"
src_url='https://sdk.cloud.google.com'

echo "Downloading: ${src_url} -> ${executable}"
wget -O "$executable" -q "$src_url"

echo "Installing from ${executable}"
bash "$executable" --disable-prompts

echo '#' >>~/.bashrc && \
  echo '#gsutil' >>~/.bashrc && \
  echo '. ~/google-cloud-sdk/completion.bash.inc' >>~/.bashrc && \
  echo '. ~/google-cloud-sdk/path.bash.inc' >>~/.bashrc


#!/usr/bin/env bash

src_url=$1
tmp=${2:-`mktemp -d`}

echo "Downloading: ${src_url} -> ${tmp}/"
wget -O "${tmp}/package.deb" -q "$src_url"

echo "Installing ${tmp}/package.deb with dpkg"
dpkg -i "${tmp}/package.deb"

echo "Fixing potential unmet dependencies"
apt-get install -yf

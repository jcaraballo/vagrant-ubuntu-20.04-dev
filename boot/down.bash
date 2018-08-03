#!/usr/bin/env bash

src_url=$1
target_dir=$2
tmp=${3:-`mktemp -d`}

echo "Downloading: ${src_url} -> ${tmp}/download/"
mkdir "${tmp}/download" && wget --directory-prefix="${tmp}/download" -q "$src_url"
echo "Decompressing: -> ${tmp}/decompress/"
mkdir "${tmp}/decompress" && tar xf "${tmp}/download/"* -C "${tmp}/decompress"

for i in "${tmp}/decompress/"* ; do basename "$i" >> "${tmp}/filenames.txt" ; done
echo "Decompressed first level filenames in ${tmp}/filenames.txt"

echo "Moving to dir ${target_dir}"
mkdir -p "$target_dir" && mv "${tmp}/decompress/"* "$target_dir"

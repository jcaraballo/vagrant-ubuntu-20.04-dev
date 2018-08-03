#!/usr/bin/env bash
dir=$(dirname $(readlink -f $0))

src_url="$1"
target_dir="$2"

echo "Installing WebStorm from url ${src_url} to directory ${target_dir}"
"${dir}/down.bash" "$src_url" "$target_dir"


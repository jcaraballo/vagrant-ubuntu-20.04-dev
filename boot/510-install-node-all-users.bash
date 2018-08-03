#!/bin/bash
dir=$(dirname $(readlink -f $0))

src_url=$1
target_dir=/opt
tmp=`mktemp -d`

echo Installing Node
"${dir}/down.bash" "$src_url" "$target_dir" "$tmp"

echo Setting up permissions and update-alternatives for Node
filenames="${tmp}/filenames.txt"
if [[ $( wc -l < ${filenames} ) -eq 1 ]] ; then
  path="${target_dir}/$( cat ${filenames} )"
  chown --recursive root:root "$path"
  update-alternatives --install /usr/bin/npm npm "${path}/bin/npm" 2000
  update-alternatives --install /usr/bin/node node "${path}/bin/node" 2000
else
  echo "WARNING: Skipping permissions and update-alternatives set up: multiple first level decompressed files:" >&2
  cat ${filenames} >&2
fi


#!/usr/bin/env bash

#dir=$(dirname $(readlink -f $0))

src_dir="$1"
target_dir="$2"

if [ -d "${src_dir}" ]; then
  echo Copying Idea config from contents of ${src_dir} to ${target_dir}/
  mkdir -p "${target_dir}" && cp -RnT "${src_dir}" "${target_dir}"
else
  echo "No source Idea config dir ${config_dir}, skipping" >2&
fi

#$( ${BOOT}/path_of_single_file_in_dir.bash ${RESOURCES}/jdk )

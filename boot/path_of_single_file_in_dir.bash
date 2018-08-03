#!/bin/bash

dir="$1"

if [ ! -d "${dir}" ]; then
  echo "No ${dir} directory" >&2
  exit 1
fi

count=$( ls -1 "$dir" | wc -l )

if [[ $count -ne 1 ]]; then
  echo "There should be exactly one file in $dir but there are $count" >&2
  exit 1
fi

echo "${dir}"/*

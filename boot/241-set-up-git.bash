#!/bin/bash

email_file="$1"
name_file="$2"

if [ -f "$email_file" ]; then
  email=$( cat "$email_file" )
  git config --global user.email "${email}"
else
  echo "No email file ${email_file}, skipping git user.email configuration" >&2
fi

if [ -f "$name_file" ]; then
  name=$( cat "$name_file" )
  git config --global user.name "${name}"
else
  echo "No name file ${name_file}, skipping git user.name configuration" >&2
fi

git config --global push.default simple
git config --global core.editor "vim"


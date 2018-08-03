#!/bin/bash
keys=$1

if [ -d "${keys}" ]; then
  if [ -f "${keys}/id_rsa" ]; then
    echo 'Adding ssh keys'
    mkdir -p ${HOME}/.ssh/ && cp ${keys}/id_rsa.pub ${keys}/id_rsa ${HOME}/.ssh/ 
  else
    echo "${keys} directory doesn't contain private key id_rsa, skipping ssh keys"
  fi
else
  echo "${keys} directory doesn't exist, skipping ssh keys"
fi

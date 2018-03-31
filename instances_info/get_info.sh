#!/bin/bash

path=$(dirname $0)
if [ "$#" -ge 1 ]; then
  name=$1
  shift
  info=${path}/instances_info/${name}.info
  if [ ! -f "$info" ]; then
    echo "Error, $info not found"
    exit -1
  fi
  source ${path}/instances_info/default
  source $info
  if [ ! -f "$priv_key" ]; then
    echo "$priv_key not found"
    exit -1
  fi
  chmod 600 ${priv_key}
else
  echo "Usage: $0 <instance_name>"
  exit -1
fi

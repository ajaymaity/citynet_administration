#!/bin/bash

# Base Script File (conf_rosetta.sh)
# Created: ven. 19 janv. 2018 19:39:30 GMT
# Version: 1.0
#
# This Bash script was developped by Cory.
#
# (c) Cory <sgryco@gmail.com>

. machine_info

ssh -p ${port} -i ${priv_key} ${user}@${IP} "
  set -e
  if [ ! -d citynet/.git ]; then
    sudo rm -rf citynet
    git clone git@gitlab.com:aseproject11/citynet.git
  else
    git -C citynet fetch --all
    git -C citynet reset --hard origin/master
  fi

  if [ ! -d config_private_citynet/.git ]; then
    sudo rm -rf config_private_citynet
    git clone git@gitlab.com:aseproject11/config_private_citynet.git
  else
    git -C config_private_citynet fetch --all
    git -C config_private_citynet reset --hard origin/master
  fi
  "

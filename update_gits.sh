#!/bin/bash

# Base Script File (conf_rosetta.sh)
# Created: ven. 19 janv. 2018 19:39:30 GMT
# Version: 1.0

set -e
. instances_info/get_info.sh

chmod 600 ${priv_key}
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
    git clone $private_git config_private_citynet
  else
    git -C config_private_citynet fetch --all
    git -C config_private_citynet reset --hard origin/master
  fi
  "

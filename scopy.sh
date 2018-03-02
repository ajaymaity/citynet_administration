#!/bin/bash

# Base Script File (conf_rosetta.sh)
# Created: ven. 19 janv. 2018 19:39:30 GMT
# Version: 1.0
#
# This Bash script was developped by Cory.
#
# (c) Cory <sgryco@gmail.com>

rootpath=$(dirname $0)
. $rootpath/machine_info

if [ $# -gt "0" ]; then
  echo "Copying files $@"
  rsync -Pazuv -e "ssh -i $priv_key -l $user -p $port" $@ $IP:
else
  echo "specify files/folders to copy"
fi

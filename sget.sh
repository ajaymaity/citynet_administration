#!/bin/bash

# Base Script File (conf_rosetta.sh)
# Created: ven. 19 janv. 2018 19:39:30 GMT
# Version: 1.0

set -e
. instances_info/get_info.sh

if [ $# -gt "0" ]; then
  echo "Copying files $@"
  chmod 600 ${priv_key}
  scp -P ${port} -i ${priv_key} -r -C ${user}@${IP}:$@ .
else
  echo "specify files/folders to copy"
fi

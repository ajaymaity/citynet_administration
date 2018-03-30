#!/bin/bash

# Base Script File (conf_rosetta.sh)
# Created: ven. 19 janv. 2018 19:39:30 GMT
# Version: 1.0
#
# This Bash script was developped by Cory.
#
# (c) Cory <sgryco@gmail.com>

. machine_info

chmod 600 ${priv_key}
for service in $services; do
  echo "restarting $service";
  ssh -p ${port} -i ${priv_key} ${user}@${IP} "sudo docker rm -f $service"
  ssh -p ${port} -i ${priv_key} ${user}@${IP} "citynet/prod/register_${service}.sh"
done

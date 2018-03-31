#!/bin/bash

# Base Script File (conf_rosetta.sh)
# Created: ven. 19 janv. 2018 19:39:30 GMT
# Version: 1.0
#

set -e
. instances_info/get_info.sh

chmod 600 ${priv_key}
for service in $services; do
echo "restarting $service"
ssh -p ${port} -i ${priv_key} ${user}@${IP} "
  [ \"\`sudo docker ps -a | grep ${service}\`\" ] && sudo docker rm -f $service
  citynet/prod/register_${service}.sh
"
done

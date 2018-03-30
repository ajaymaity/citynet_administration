#!/bin/bash

# Base Script File (conf_rosetta.sh)
# Created: ven. 19 janv. 2018 19:39:30 GMT
# Version: 1.0
#
# This Bash script was developped by Cory.
#
# (c) Cory <sgryco@gmail.com>

rootpath=$(dirname $0)
. ${rootpath}/machine_info

chmod 600 ${priv_key}
secret=${rootpath}/../bash_import_secret_aws
echo "Copying file $secret"
rsync -Pazuv -e "ssh -i $priv_key -l $user -p $port" $secret ${IP}:config_private_citynet/

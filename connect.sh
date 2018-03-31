#!/bin/bash

# Base Script File (conf_rosetta.sh)
# Created: ven. 19 janv. 2018 19:39:30 GMT
# Version: 1.0
#
set -e
. instances_info/get_info.sh

ssh -v -p ${port} -i ${priv_key} ${user}@${IP}

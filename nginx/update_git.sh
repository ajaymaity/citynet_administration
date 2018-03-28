#!/bin/bash

# Base Script File (conf_rosetta.sh)
# Created: ven. 19 janv. 2018 19:39:30 GMT
# Version: 1.0
#
# This Bash script was developped by Cory.
#
# (c) Cory <sgryco@gmail.com>

. machine_info

ssh -p ${port} -i ${priv_key} ${user}@${IP} "git -C citynet fetch --all && git -C citynet reset --hard origin/master"

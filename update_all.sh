#!/bin/bash

# Base Script File (update_all.sh)
# Created: Sun 01 Apr 2018 22:29:29 IST
# Version: 1.0
#


for instance in instances_info/*info; do
  name=$(basename $instance)
  name=${name%.info}
  ./update_gits.sh $name && ./restart_services.sh $name
done


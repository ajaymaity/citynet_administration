#!/bin/bash

# Base Script File (install_base.sh)
# Created: Sat 31 Mar 2018 17:00:29 IST
# Version: 1.0


set -e
. instances_info/get_info.sh

./scopy.sh $name .ssh .tmux.conf

ssh -p ${port} -i ${priv_key} ${user}@${IP} "
set -e
sudo locale-gen --purge en_IE.UTF-8
echo -e 'LANG=en_IE.UTF-8\nLANGUAGE=en_IE.UTF-8\nLC_ALL=en_IE.UTF-8\n' | sudo tee /etc/default/locale

# install docker from https://docs.docker.com/install/linux/docker-ce/ubuntu/
sudo apt-get update -y
sudo apt-get install -y htop apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository -y \"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\"
sudo apt-get update
sudo apt-get -y upgrade 
sudo apt-get install -y docker-ce
chmod 600 .ssh/id_rsa
sudo hostnamectl set-hostname citynet-$name
echo "127.0.0.1 citynet-$name" | sudo tee -a /etc/hosts
"
./update_gits.sh $name
./restart_services.sh $name

ssh -p ${port} -i ${priv_key} ${user}@${IP} "sudo reboot"

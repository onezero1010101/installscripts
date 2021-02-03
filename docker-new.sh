#!/bin/bash

curl -fsSL https://get.docker.com -o get-docker.sh 
sh get-docker.sh

sudo usermod -aG docker $USER

ver=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')
sudo curl -L "https://github.com/docker/compose/releases/download/$ver/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

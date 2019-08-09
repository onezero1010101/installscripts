#!/bin/bash
#Install packages to allow apt to use a repository over HTTPS:
apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common -y

#Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

#Use the following command to set up the stable repository.
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

#Update the apt package index.
apt-get update

#Install the latest version of Docker Engine - Community and containerd, or go to the next step to install a specific version:

apt-get install docker-ce docker-ce-cli containerd.io -y


#portainer.io install
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data --restart always --name portainer portainer/portainer

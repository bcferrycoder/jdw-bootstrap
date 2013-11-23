#!/bin/bash

USER=jdw

# run this on ubuntu 13.04 host to install docker

sudo apt-get update
sudo apt-get -y install linux-image-extra-`uname -r`

# Add the Docker repository key to your local keychain
# using apt-key finger you can check the fingerprint matches 36A1 D786 9245 C895 0F96 6E92 D857 6A8B A88D 21E9
sudo sh -c "curl https://get.docker.io/gpg | apt-key add -"

# Add the Docker repository to your apt sources list.
sudo sh -c "echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"

# update
sudo apt-get update

# install
sudo apt-get -y install lxc-docker

# verify
sudo docker version
sudo docker run -i -t ubuntu /bin/bash -c echo docker installed

sudo apt-get install -y git-core

sudo useradd -d /home/${USER} -c "${USER}" -s /bin/bash ${USER}
sudo git clone https://github.com/bcferrycoder/jdw-bootstrap.git /home/${USER}
sudo mkdir -p /home/${USER}/.git /home/${USER}/.ssh
sudo cp ~ubuntu/.ssh/authorized_keys /home/${USER}/.ssh
sudo chmod -R 700 /home/${USER}/.ssh
sudo chown -R ${USER}.${USER} /home/${USER}
echo "${USER} ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers > /dev/null
sudo cp config/john-gitconfig /home/${USER}/.git/config

echo 'this host is now docker-ready'
echo "type \"sudo su - ${USER} to proceed\""

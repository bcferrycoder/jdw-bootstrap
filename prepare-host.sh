#!/bin/bash

USER=jdw

# run this on ubuntu 13.04 host to install docker

apt-get install -q -y git-core

apt-get update
apt-get install linux-image-extra-`uname -r`

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9

sh -c "echo deb http://get.docker.io/ubuntu docker main\
> /etc/apt/sources.list.d/docker.list"
sudo apt-get update
sudo apt-get install lxc-docker


# verify
docker version
docker run -i -t ubuntu /bin/bash -c echo docker installed

useradd -d /home/${USER} -c "${USER}" -s /bin/bash ${USER}
git clone https://github.com/bcferrycoder/jdw-bootstrap.git /home/${USER}
mkdir -p /home/${USER}/.git /home/${USER}/.ssh
cp ~ubuntu/.ssh/authorized_keys /home/${USER}/.ssh
chmod -R 700 /home/${USER}/.ssh
chown -R ${USER}.${USER} /home/${USER}
echo "${USER} ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers > /dev/null
cp config/john-gitconfig /home/${USER}/.git/config

# Add the docker group if it doesn't already exist.
sudo groupadd docker

# Add the connected user "${USER}" to the docker group.
# Change the user name to match your preferred user.
# You may have to logout and log back in again for
# this to take effect.
sudo gpasswd -a ${USER} docker

# Restart the Docker daemon.
sudo service docker restart


echo 'this host is now docker-ready'
echo "type \"sudo su - ${USER} to proceed\""

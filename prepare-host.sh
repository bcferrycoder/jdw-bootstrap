#!/bin/bash

USER=jdw

apt-get install -q -y git-core

apt-get update
apt-get install -y emacs24

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
sudo gpasswd -a ${USER} docker

# Restart the Docker daemon.
sudo service docker restart

echo 'this host is now docker-ready'
echo "type \"sudo su - ${USER} to proceed\""

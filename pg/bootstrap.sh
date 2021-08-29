#!/usr/bin/env bash

apt-get update
apt-get -y upgrade

# Docker https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04-ja
echo "[INFO] Installing Docker Community Edition (CE)"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository --yes "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-get -y install docker-ce docker-compose

systemctl enable --now docker
usermod -aG docker vagrant

echo "[INFO] Installing general tools for C++ development"
apt-get -y install \
    silversearcher-ag gdb clang-format tree

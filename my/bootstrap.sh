#!/usr/bin/env bash

apt-get update
apt-get -y upgrade

echo "[INFO] Installing MariaDB/MySQL development dependencies"
# MariaDB https://mariadb.com/kb/en/building-mariadb-on-ubuntu/
apt-get -y install \
    software-properties-common devscripts equivs

apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
add-apt-repository --update -y --enable-source \
       'deb [arch=amd64] http://nyc2.mirrors.digitalocean.com/mariadb/repo/10.6/ubuntu '$(lsb_release -sc)' main'
apt-get -y build-dep mariadb-10.6

# MySQL https://nayuta-yanagisawa.hatenablog.com/entry/2021/03/23/225107
apt-get -y install \
    cmake g++ pkg-config zip unzip libjson-perl

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

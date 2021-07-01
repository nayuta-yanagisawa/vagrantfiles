#!/usr/bin/env bash

apt-get update
apt-get -y upgrade

echo "Installing MySQL/MariaDB build dependencies"
apt-get -y install \
    curl silversearcher-ag gdb clang-format \
    cmake g++ pkg-config zip unzip libjson-perl \   # MySQL build and test dependencies
    software-properties-common devscripts equivs    # MariaDB build dependencies

# MariaDB https://mariadb.com/kb/en/building-mariadb-on-ubuntu/
apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
add-apt-repository --update --yes --enable-source \
       'deb [arch=amd64] http://nyc2.mirrors.digitalocean.com/mariadb/repo/10.5/ubuntu '$(lsb_release -sc)' main'
apt-get -y build-dep mariadb-10.5

# Docker https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04-ja
echo "Installing Docker Community Edition"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository --yes "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-get -y install docker-ce docker-compose

systemctl enable --now docker
usermod -aG docker vagrant

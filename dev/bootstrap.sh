#!/usr/bin/env bash

apt-get update
apt-get -y upgrade
apt-get install -y \
    silversearcher-ag gdb docker.io docker-compose \
    cmake g++ pkg-config zip unzip libjson-perl     # MySQL build and test dependencies
    software-properties-common devscripts equivs    # MariaDB build dependencies

# MariaDB
apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
add-apt-repository --update --yes --enable-source \
       'deb [arch=amd64] http://nyc2.mirrors.digitalocean.com/mariadb/repo/10.5/ubuntu '$(lsb_release -sc)' main'
apt-get build-dep mariadb-10.5

# Docker
systemctl enable --now docker
usermod -aG docker vagrant

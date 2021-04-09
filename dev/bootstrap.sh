#!/usr/bin/env bash

apt-get update
apt-get -y upgrade
apt-get install -y \
    silversearcher-ag gdb docker.io docker-compose \
    cmake g++ pkg-config zip unzip libjson-perl # MySQL build and test dependencies

# Docker
systemctl enable --now docker
usermod -aG docker vagrant

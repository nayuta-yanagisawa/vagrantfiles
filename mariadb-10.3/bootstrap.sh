#!/usr/bin/env bash

apt-get update

https://mariadb.com/kb/en/building-mariadb-on-ubuntu/
yes | apt-get install software-properties-common devscripts equivs
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 \
      0xF1656F24C74CD1D8
sudo add-apt-repository --update --yes --enable-source \
       'deb [arch=amd64] http://nyc2.mirrors.digitalocean.com/mariadb/repo/10.3/ubuntu '$(lsb_release -sc)' main'
yes | sudo apt-get build-dep mariadb-10.3

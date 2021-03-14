#!/usr/bin/env bash

apt-get update
apt-get -y upgrade
apt-get install -y \
    silversearcher-ag \
    cmake g++ pkg-config zip unzip libjson-perl # MySQL build and test dependencies

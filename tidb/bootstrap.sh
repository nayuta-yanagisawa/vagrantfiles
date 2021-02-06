#!/usr/bin/env bash

yes | add-apt-repository pa:longsleep/golang-backports
yes | apt-get update
yes | apt-get upgrade
yes | apt-get install silversearcher-ag golang-go

#!/bin/bash
vagrant ssh-config --host ${PWD##*/}>> ~/.ssh/config

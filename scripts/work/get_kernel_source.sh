#!/bin/bash

read -p 'Please input the Ubuntu distro (e.g., "xenial"): ' DISTRO

# cloning the source tree
echo "Getting the source tree for ${DISTRO}" 
mkdir -p ~/github
cd ~/github
git clone https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/${DISTRO}
cd ${DISTRO}

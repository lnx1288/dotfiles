#!/bin/bash

echo 'Updating/upgrading...'
sudo apt update
sudo apt upgrade -y

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "...installing: ${1}..."
    sudo apt install -y $1
  else
    echo "...skipped, already installed: ${1}"
  fi
}

function snap_install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "...installing snap: ${1}..."
    sudo snap install $1
  else
    echo "...skipped, already installed: ${1}"
  fi
}

# Basics
install curl
install htop
install vim

# Snaps
snap_install cmadison

#

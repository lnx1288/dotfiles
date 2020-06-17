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
install firefox
install clamav
install clamtk
install curl
install git
install htop
install nmap
install tmux
install vim
install virtualbox
install virtualbox-ext-pack
install gnome-tweak-tool
install gnome-shell-extensions
install google-chrome-stable
install gparted
install vlc
install opera-stable
install remmina
install timeshift
install qemu
install qemu-kvm
install libvirt-bin
install bridge-utils
install virt-manager
install conky-all

# Snaps
snap_install pac-vs
snap_install wps-office
snap_install wps-office-multilang
snap_install cmadison
snap_install hexchat

# Others
sudo snap install atom --classic

#

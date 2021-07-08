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
install clamav
install clamtk
install curl
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
snap_install cmadison
snap_install 'atom --classic'

# VS Code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | \
gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] \
https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

install apt-transport-https
sudo apt update
install install code
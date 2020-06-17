#!/bin/bash

echo 'Configuring Conky...'
ln -sfv ${HOME}/.dotfiles/config/conky/.conkyrc ${HOME}/.conkyrc

# Create autostart folder if it doesn't exist
if [ ! -d ${HOME}/.config/autostart/ ]; then
  mkdir -p ${HOME}/.config/autostart/;
fi

# Config Conky to autostart on boot
cp ${HOME}/.dotfiles/config/conky/conky.desktop ${HOME}/.config/autostart/
chmod +x ${HOME}/.config/autostart/conky.desktop
gio set ${HOME}/.config/autostart/conky.desktop "metadata::trusted" yes

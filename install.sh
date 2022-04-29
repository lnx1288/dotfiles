#!/usr/bin/env bash

DOTFILES_DIR="${HOME}/.dotfiles"

# update and pre-requisites 
sudo apt-get install -y ansible

# clone dotfiles repo
echo "Cloning dotfiles from ${REPO}, branch ${DEFAULT_BRANCH}"
REPO="${REPO:-git@github.com:lnx1288/dotfiles.git}"
git clone "${REPO}" "${DOTFILES_DIR}"
cd "${DOTFILES_DIR}" || exit

# run playbook(s)
#ansible-playbook --ask-become-pass --ask-vault-pass -i hosts main.yaml
ansible-playbook -i hosts main.yaml
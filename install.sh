#!/usr/bin/env bash

# update and pre-requisites 
sudo apt-get install -y ansible

# run playbook(s)
#ansible-playbook --ask-become-pass --ask-vault-pass -i hosts main.yaml
ansible-playbook -i hosts main.yaml

# Success
exit 0
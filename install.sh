#!/usr/bin/env bash

# update and pre-requisites 
sudo apt update
sudo apt-get install -y ansible  

# run playbook(s)
ansible-playbook --ask-become-pass --ask-vault-pass -i hosts main.yaml

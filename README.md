# Dotfiles

## Getting Started  

Dotfiles for Ubuntu systems (tested on Ubuntu 20.04 but should work on
other releases as well).

## Installing

Run:

```bash
sudo apt-get install -y git
git clone https://github.com/lnx1288/dotfiles.git $HOME/.dotfiles
cd $HOME/.dotfiles
chmod +x install.sh
./install.sh
sudo reboot
```

This will install Ansible and will run the `main.yaml` playbook.

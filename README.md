# Dotfiles

## Getting Started  

If you want to test the environment just follow these instructions:  
* Install all the dependencies.  
* Go to your home directory.  
* Clone the repository.  
* Change the name of the dotfiles directory to .dotfiles.  
* Go into the directory.
* Take a look into the install scripts to change any user related information.
* Run the install scripts.  

## Prerequisites  

Before executing any script in this folder you need to (default setting is for Ubuntu):  

```
sudo apt install -y vim curl tmux git bash-completion

```
## Installing

How to get a development env up and running

1. Clone the repo and edit the vars file within the config folder:

```
cd
git clone https://github.com/lnx1288/dotfiles.git
mv dotfiles .dotfiles && cd .dotfiles
vim config/vars
```

2. Run the install scripts

```
** Change needed script parameters **
./install
./install-root
```
## Authors

Forked from the work started by:

* **Aristides Gonzalez** - *based on the initial work by* - [Cello1500](https://github.com/cello1500)

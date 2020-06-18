#!/usr/bin/env bash

tmpfile=$(mktemp)
cat ~/.dotfiles/config/git/gitconfig | envsubst > "$tmpfile" &&  mv "$tmpfile" ~/.dotfiles/config/git/gitconfig
ln -fsv ~/.dotfiles/config/git/gitconfig ~/.gitconfig
ln -fsv ~/.dotfiles/config/git/gitignore_global ~/.gitignore_global

# Git aliases
alias wconfgit="git config user.name \"$GIT_USER\"; git config user.email \"$GIT_EMAIL\""   # personal account details for local repo

# SSH config for multiple git accounts
if [[ ! -z $GIT_WORK_USER || ! -z $GIT_WORK_EMAIL ]]; then
  ln -fsv ~/.dotfiles/config/git/config ~/.ssh/config
  # alias to set up work account details on local repo
  alias pconfgit="git config user.name \"$GIT_WORK_USER\"; git config user.email \"$GIT_WORK_EMAIL\""
fi

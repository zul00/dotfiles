#!/bin/sh

echo "Deploying dotfiles"

stow configs
stow emacs
stow git
stow tmux
stow vim
stow taskwarrior

mkdir -p ~/bin
stow scripts -t ~/bin

mkdir -p ~/.fonts
stow fonts -t ~/.fonts

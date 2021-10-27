#!/bin/sh

echo "Deploying dotfiles"

stow configs -t ~/.config

stow emacs

mkdir -p ~/.fonts
stow fonts -t ~/.fonts

stow git

stow home

mkdir -p ~/bin
stow scripts -t ~/bin

stow tmux

stow vim

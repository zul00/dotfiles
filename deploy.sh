#!/bin/sh

echo "Deploying dotfiles"

stow configs
stow emacs
stow git
stow tmux
stow vim

mkdir ~/bin
stow scripts -t ~/bin

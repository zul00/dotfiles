#!/bin/sh

echo "Deploying dotfiles"

stow configs -t ~/.config

stow emacs -t ~

mkdir -p ~/.fonts
stow fonts -t ~/.fonts

stow git -t ~

stow home -t ~

mkdir -p ~/bin
stow scripts -t ~/bin

stow tmux -t ~

stow vim -t ~

#!/usr/bin/env zsh

# From: https://github.com/ThePrimeagen/.dotfiles/blob/master/install
export STOW_FOLDERS="bin,nvim,tmux,zsh"
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    echo "› stow $folder"
    stow -D $folder
    stow $folder
done

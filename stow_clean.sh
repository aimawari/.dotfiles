#!/usr/bin/env zsh

# From: https://github.com/ThePrimeagen/.dotfiles/blob/master/clean-env
export STOW_FOLDERS="bin,nvim,tmux,zsh"
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    echo "› Removing $folder"
    stow -D $folder
    stow $folder
done

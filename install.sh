#!/bin/bash

########## Variables
dir=~/dotfiles

# old dotfiles backup directory
olddir=~/dotfiles_old

# list of files/folders to symlink in homedir
files=".bashrc .bash_aliases .bashenv .i3 .vim .vimrc .tmux.conf"


######### Installation
# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~/ ..."
mkdir -p $olddir

# change to the dotfiles directory
echo "Changing to the $dir directory ..."
cd $dir
echo -e "\n"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    mv ~/$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory ..."
    ln -s $dir/$file ~/$file
done
echo "Completed!"

#!/bin/bash

echo "== Setting up symlinks for config files =="
lncom="ln -sfvT" # symbolic link, force, verbose

$lncom ~/linuxconfig/.bashrc ~/.bashrc
source ~/.bashrc
$lncom ~/linuxconfig/.inputrc ~/.inputrc
$lncom ~/linuxconfig/.ssh/config ~/.ssh/config
$lncom ~/linuxconfig/.profile ~/.profile
$lncom ~/linuxconfig/.gitconfig ~/.gitconfig
$lncom ~/linuxconfig/.emacs.d/ ~/.emacs.d/
$lncom ~/linuxconfig/.latexmkrc ~/.latexmkrc

# konsole settings
$lncom ~/linuxconfig/.config/konsolerc ~/.config/konsolerc
$lncom ~/linuxconfig/konsole_default_profile  ~/.local/share/konsole/default.profile

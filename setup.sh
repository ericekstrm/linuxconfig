#!/bin/bash

echo "== Setting up symlinks for config files =="
lncom="ln -sfv" # symbolic link, force, verbose

$lncom ~/linuxconfig/bashrc ~/.bashrc
source ~/.bashrc
$lncom ~/linuxconfig/ssh_config ~/.ssh/config
$lncom ~/linuxconfig/bash-profile ~/.profile
$lncom ~/linuxconfig/gitconfig ~/.gitconfig
$lncom ~/linuxconfig/emacs_init.el ~/.emacs.d/init.el

if [ "$DESKTOP_SESSION" == "plasma" ]
then
    echo "== Detected KDE plasma, setting up KDE plasma config =="
    $lncom ~/linuxconfig/konsolerc ~/.config/konsolerc
    $lncom ~/linuxconfig/konsole_default_profile  ~/.local/share/konsole/default.profile 

fi

#!/bin/bash

echo "== Setting up symlinks for config files =="
lncom="ln -sfv" # symbolic link, force, verbose

$lncom ~/linuxconfig/.emacs ~/.emacs
$lncom ~/linuxconfig/.bashrc ~/.bashrc
$lncom ~/linuxconfig/.ssh/config ~/.ssh/config
$lncom ~/linuxconfig/.ssh/authorized_keys ~/.ssh/authorized_keys

if [ "$DESKTOP_SESSION" == "plasma" ]
then
    echo "== Detected KDE plasma, setting up KDE plasma config =="
    $lncom ~/linuxconfig/.config/konsolerc ~/.config/konsolerc
    $lncom ~/linuxconfig/.local/share/konsole/default.profile  ~/.local/share/konsole/default.profile 

fi

#!/bin/bash

echo "== Setting up symlinks for config files =="
lncom="ln -sfv"

$lncom ~/linuxconfig/.emacs ~/.emacs
$lncom ~/linuxconfig/.bashrc ~/.bashrc

if [ "$DESKTOP_SESSION" == "plasma" ]
then
    echo "== Detected KDE plasma, setting up KDE plasma config =="
    $lncom ~/linuxconfig/.config/konsolerc ~/.config/konsolerc
    $lncom ~/linuxconfig/.local/share/konsole/default.profile  ~/.local/share/konsole/default.profile 

fi

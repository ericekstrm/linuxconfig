# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

alias ll='ls -alFh'
alias sl="ls"
alias l="ls"
alias s="ls"
alias ..='cd ..'

export EDITOR=emacs

alias getlab='~/upp/getlab-cli/staff_cli.py'

alias g++='g++ -Wall -Wextra -Weffc++ -Wold-style-cast -Woverloaded-virtual -std=c++2a -pedantic -g'
alias make='make -j32'

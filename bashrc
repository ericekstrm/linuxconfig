
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

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

# Set prompt (With colors)
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Emacs
export EDITOR=emacs
alias e=emacs
# alias emacs='emacsclient -nc -a=""'

# ls variants
alias ll='ls -alFh'
alias sl="ls"
alias l="ls"
alias s="ls"
alias ..='cd ..'
# Getlab
alias getlab='~/upp/getlab-cli/staff_cli.py'
# Weather
alias wttr='curl https://wttr.in/link%C3%B6ping?M1Fq'
alias make='make -j32'
alias untar='\tar -xf'
alias tar='\tar -cf'

# Christoffers mega-hack för att hitta senaste g++-versionen på systemet.
compiler=$(for i in $(find ${PATH//:/ } -name "g++*" 2>/dev/null); do echo $($i --version | grep -oe "[0-9]\+\\.[0-9]\+\\.[0-9]\+" | head -1) $i; done | sort -n | tail -1 | cut -d' ' -f2)
compiler_version=$($compiler --version | grep -oe "[0-9]\+\\.[0-9]\+\\.[0-9]\+" | head -1)

# find newest version of gcc, and create alias 
if [ $(echo $compiler_version | cut -f1 -d.) -ge 10 ];
then
   alias g++='$compiler -std=c++20 -Wall -Wextra -Weffc++ -Wold-style-cast -Woverloaded-virtual -pedantic -g'
else
   alias g++='$compiler -std=c++2a -Wall -Wextra -Weffc++ -Wold-style-cast -Woverloaded-virtual -pedantic -g'
fi

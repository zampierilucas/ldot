#!/bin/sh

# Ambient variables
export ANDROID_HOME=/mnt/HD0/Android
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Number of monitors connectes
export MONITORS=`xrandr -q | grep "*" | wc -l`  # count number of lines in bspwm's monitor list

# Default programs:
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="chromium"
export FILE="ranger"
export STATUSBAR="polybar"

# Shortcut
alias vim='nvim'
alias clip='xclip -select clipboard'
alias ..='cd ..'
alias ...='cd ../..'
alias ls='ls --color=auto'
alias sl='ls'

# Init Programs
unclutter &  # Disable mouse when idle
tput smkx


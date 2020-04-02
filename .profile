#!/bin/sh

# Ambient variables
export ANDROID_HOME=/mnt/HD0/Android
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

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



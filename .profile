#!/bin/zsh

# Number of monitors connectes
export MONITORS=`xrandr -q | grep "*" | wc -l`
export DEFAULT_NETWORK_INTERFACE=`ip route | grep '^default' | awk '{print $5}' | head -n1`
#export IsThinkpad=$([ `uname -n` == "revenge"  ] && true || false)

# Default programs:
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="google-chrome-stable"
export FILE="nautilus"
export STATUSBAR="polybar"

# Shortcut
alias cat='bat'
alias vim='nvim'
alias rvim='sudo -E nvim'
alias clip='xclip -select clipboard'
alias ..='cd ..'
alias ...='cd ../..'
alias ls='ls --color=auto'
alias sl='ls'
alias gst='git status'
alias co='checkout'
alias gpo='git push origin HEAD'
alias spotify='spicetify apply'
alias reload='xrdb -merge ~/.Xresources'
alias yasu='yay -Syu --noconfirm'
alias mirrorlistUpdate='sudo reflector --verbose -l 200 -n 20 -p http --sort rate --save /etc/pacman.d/mirrorlist'
alias keyname="xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf \"%-3s %s\n\", \$5, \$8 }'"
alias ssh='TERM=xterm-256color ssh'

source ~/.config/bspwm/monitorConfig.sh
source ~/.secrets.env
export XDG_CONFIG_HOME="$HOME/.config/"
export PATH=~/.npm-global/bin:$PATH
export _JAVA_AWT_WM_NONREPARENTING=1

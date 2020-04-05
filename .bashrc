#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source .profile
PS1='[\u@\h \W]\$ '

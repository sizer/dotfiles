#!/bin/bash
alias ll='ls -la'

# display git branch name
source ~/dotfiles/git/git-prompt.sh
source ~/dotfiles/git/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUPSTREAM=true
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\n\$ '

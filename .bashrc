#!/bin/bash

# daily
alias ls='ls --color=auto'
alias ll='ls -AGlh --color=auto'
alias his='history | peco'

# docker
alias dstop="docker stop $@"
alias dps="docker ps"
alias dpsq="docker ps -q"
alias dsync="docker-sync start"
alias dupd="docker-compose up -d"
alias dexe="docker exec -it $@"

# rails
alias b="bundle"
alias be="bundle exec"
alias ber="bundle exec rails"

# ghq
alias g='cd $(ghq root)/$(ghq list | peco)'
alias gh='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'
alias hcurl='curl -D - -s -o /dev/null'

# display git branch name
source ~/dotfiles/git/git-prompt.sh
source ~/dotfiles/git/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUPSTREAM=true
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\n\$ '

# history
HISTSIZE=500
HISTFILESIZE=5000
HISTCONTROL=ignoreboth
HISTIGNORE=?:history:his:exit

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/sizer/.sdkman"
[[ -s "/home/sizer/.sdkman/bin/sdkman-init.sh" ]] && source "/home/sizer/.sdkman/bin/sdkman-init.sh"

#!/bin/bash

#########
# Alias #
#########

# daily
alias ls='ls --color=auto'
alias ll='ls -AGlh --color=auto'
alias his='history | peco'

# docker
alias dstop="docker stop $@"
alias dps="docker ps"
alias dpsq="docker ps -q"
alias dsync="docker-sync start"
alias dupd="docker compose up -d"
alias dexe="docker exec -it $@"

# rails
alias b="bundle"
alias be="bundle exec"
alias ber="bundle exec rails"

# gcloud
alias gcpq="gcloud config configurations list | tail -n +2 | peco | awk '{print \$1}' | xargs gcloud config configurations activate"

# ghq
alias g='cd $(ghq root)/$(ghq list | peco)'
alias gh='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'
alias hcurl='curl -D - -s -o /dev/null'

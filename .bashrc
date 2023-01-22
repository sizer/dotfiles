#!/bin/bash

#########
# Alias #
#########
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

#########################
# Environment Variables #
#########################
# display git branch name
source ~/dotfiles/git/git-prompt.sh
source ~/dotfiles/git/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUPSTREAM=true
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\n\$ '

# history
HISTSIZE=5000
HISTFILESIZE=5000
HISTCONTROL=ignoreboth
HISTIGNORE=?:history:his:exit

# ghq
if which ghq >/dev/null; then
  export GHQ_ROOT=~/.ghq
fi

# Ansible
if which ansible >/dev/null; then
  export ANSIBLE_VAULT_PASSWORD_FILE=~/.ansible_vault_pass
fi

# sdkman
if which sdkman >/dev/null; then
  #THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
  export SDKMAN_DIR="/home/sizer/.sdkman"
  [[ -s "/home/sizer/.sdkman/bin/sdkman-init.sh" ]] && source "/home/sizer/.sdkman/bin/sdkman-init.sh"
fi

# Zsh shell config

#########
# Alias #
#########
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases

#########################
# Environment Variables #
#########################
# display git branch name
source ~/dotfiles/git/git-prompt.sh
source ~/dotfiles/git/git-completion.zsh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUPSTREAM=true
# export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\n\$ '
autoload -Uz vcs_info
precmd() { vcs_info }
setopt prompt_subst
# export PS1='%F{green}%n@%m%f:%F{blue}%~%f$(__git_ps1 "%F{red} (%s)%f")\n\$ '
export PS1='%F{green}%n@%m%f:%F{blue}%-%f%F{red}${vcs_info_msg_0_}%f%n
$ '

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
  export SDKMAN_DIR="$HOME/.sdkman"
  [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

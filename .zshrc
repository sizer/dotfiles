# Zsh shell config

# Completion
fpath=(~/dotfiles/git/zsh/completion $fpath)
autoload -Uz compinit
compinit


#########
# Alias #
#########
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases

#########################
# Environment Variables #
#########################

# display git branch name
autoload -Uz vcs_info
precmd() { vcs_info }
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '(%b) %u'
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u) %u'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' unstagedstr '*'
zstyle ':vcs_info:git:*' stagedstr '+'
zstyle ':vcs_info:git:*' cleanstr '='
export PS1='%F{green}%n@%m%f:%F{blue}%~%f%F{red} ${vcs_info_msg_0_}%f
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

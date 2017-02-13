# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi



# History options
HISTSIZE=10000000                   # The maximum number of events to save in the internal history.
SAVEHIST=10000000                   # The maximum number of events to save in the history file.
unsetopt HIST_VERIFY                # Do not execute immediately upon history expansion.

# autocomplete - single group
zstyle ':completion:*:*:*:*:*' menu select


# bash stuff
# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# IP definitions
if [ -f ~/.external_ips ]; then
    source ~/.external_ips
fi

# vars
if [ -f ~/.bashenv ]; then
    source ~/.bashenv
fi

source /usr/local/bin/virtualenvwrapper.sh


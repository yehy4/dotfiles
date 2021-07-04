# Aliases
alias ls="ls --color=auto"

# Set history size loaded into the shell
HISTSIZE=100000

# Set history size stored on disk
HISTFILE=~/.zsh_history
SAVEHIST=1000000

# Enable vi mode
bindkey -v

# Set editor to vim
export EDITOR="/usr/bin/vim"

# Enable command auto-completion
autoload -Uz compinit
compinit

# Enable auto-completion with menu
zstyle ':completion:*' menu select
# Load complist module to ensure the following binkey commands do not fail
# when sourcing for the first time
zmodload zsh/complist

# Enable vi navigation in auto-completion menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Set prompt
autoload -Uz promptinit
promptinit
prompt adam1

# Add syntax highlighting to show incorrect commands
if (( ${+ZSH_SYNTAX_HIGHLIGHTING_PATH} )); then
  source $ZSH_SYNTAX_HIGHLIGHTING_PATH
else
    echo "Warning: zsh-syntax-highlighting path is undefined"
fi

# Add autosuggestions
if (( ${+ZSH_AUTOSUGGESTIONS_PATH} )); then
  source $ZSH_AUTOSUGGESTIONS_PATH
else
    echo "Warning: zsh-autosuggestions path is undefined"
fi

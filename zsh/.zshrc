# ####################################################################
# Pre Settups {{{

# --------------------------------------------------------------------
# Pre Settups; oh-my-zsh {{{

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# HIST_STAMPS="mm/dd/yyyy"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  asdf
  fzf
  zsh-autosuggestions
)

# }}} Pre Settups; oh-my-zsh
# --------------------------------------------------------------------

# }}} Pre Settups
# ####################################################################

# ####################################################################
# Options {{{

# --------------------------------------------------------------------
# Options; keys {{{

# bindkey as emac
bindkey -e

# bind CTRL + SPACE to accept autosuggest (zsh-autosuggestions)
bindkey '^ ' autosuggest-accept

# disable CTRL-S and CTRL-Q
[[ $- =~ i ]] && stty -ixoff -ixon

# }}} Options; keys
# --------------------------------------------------------------------

# }}} Options
# ####################################################################

# ####################################################################
# Env {{{

# --------------------------------------------------------------------
# Env; Global {{{

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=vim

# }}} Env; Global
# --------------------------------------------------------------------

# --------------------------------------------------------------------
# Env; golang {{{

[ -n "$GOROOT" ] && export PATH=$GOROOT/bin:$PATH
export PATH=${GOPATH:-~/go/bin}:$PATH

# }}} Env; golang
# --------------------------------------------------------------------

# --------------------------------------------------------------------
# Env; fzf {{{

export FZF_DEFAULT_COMMAND='rg --files --hidden --column --line-number --no-heading --smart-case --glob "!.git/*"'
export FZF_DEFAULT_OPTS='--reverse --cycle --height=40%'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_CTRL_T_OPTS=$FZF_DEFAULT_OPTS
export FZF_ALT_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_ALT_T_OPTS=$FZF_DEFAULT_OPTS

# }}} Env; fzf
# --------------------------------------------------------------------

# --------------------------------------------------------------------
# Env; ibus-hangul {{{

if [[ "$OSTYPE" = *"linux-gnu" ]]; then
  export GTK_IM_MODULE=ibus
  export XMODIFIERS=@im=ibus
  export QT_IM_MODULE=ibus
fi

# }}} Env; ibus-hangul
# --------------------------------------------------------------------

# }}} Env
# ####################################################################

# ####################################################################
# Prompt {{{

# --------------------------------------------------------------------
# Prompt; zsh {{{

source $ZSH/oh-my-zsh.sh

autoload -Uz compinit promptinit
compinit
promptinit
prompt pure
zstyle ':completion:*' menu select

# }}} Prompt; zsh
# --------------------------------------------------------------------

# --------------------------------------------------------------------
# Prompt; Colors {{{

#if [ -r "~/.dir_colors" ]; then
#  eval $(dircolors ~/.dir_colors)
#fi

# }}} Prompt; Colors
# --------------------------------------------------------------------

# }}} Prompt
# ####################################################################

# ####################################################################
# Aliases {{{

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias cd.='cd ..'
alias cd..='cd ../..'
alias ls='ls --color=auto'
alias l='ls -l'
alias ll='ls -la'
alias vi=$EDITOR
alias vim=$EDITOR
alias bat='bat --theme="base16"'
alias ssh='TERM="xterm-256color" ssh'
alias tmux='tmux -2'

# }}} Aliases
# ####################################################################


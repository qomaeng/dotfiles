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

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  asdf
  fzf
  rust
  terraform
  zsh-autosuggestions
  zsh-completions
)

source $ZSH/oh-my-zsh.sh

######################################################################
# Prompt; Colors
######################################################################

# pure theme
fpath+="$HOME/.zsh/pure"

autoload -U promptinit
promptinit
prompt pure

######################################################################
# Prompt; zsh
######################################################################

# zsh-users/zsh-completions
fpath+="$HOME/.oh-my-zsh/custom/plugins/zsh-completions/src"

# zsh auto completion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

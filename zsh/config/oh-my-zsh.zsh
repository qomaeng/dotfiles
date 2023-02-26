ZSH=/usr/share/oh-my-zsh/

ZSH_THEME=""

zstyle ':omz:update' mode disabled
plugins=(
  asdf
  fzf
  rust
  terraform
  zsh-autosuggestions
)

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

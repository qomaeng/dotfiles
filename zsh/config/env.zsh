##
## PATH & ENV Var
##

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export GPG_TTY="${TTY:-$(tty)}"

#export SUDO_PROMPT="passwd: "
export TERMINAL="alacritty"
export BROWSER="firefox"
export VISUAL="nvim"
export EDITOR="nvim"

## XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CONFIG_DIRS="/etc/xdg"
# export XDG_DATA_DIRS="/usr/local/share:/usr/share:/var/lib/flatpak/exports/share:$XDG_DATA_HOME/flatpak/exports/share"
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export XDG_DESKTOP_DIR="$HOME/Desktop"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_TEMPLATES_DIR="$HOME/Templates"
export XDG_PUBLICSHARE_DIR="$HOME/Public"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_VIDEOS_DIR="$HOME/Videos"

## Comment this to use normal manpager
export MANPAGER='nvim +Man! +"set nocul" +"set noshowcmd" +"set noruler" +"set noshowmode" +"set laststatus=0" +"set showtabline=0" +"set nonumber"'

if [ $(echo $MANPAGER | awk '{print $1}') = nvim ]; then
  export LESS="--RAW-CONTROL-CHARS"
  export MANPAGER="less -s -M +Gg"

  export LESS_TERMCAP_mb=$'\e[1;32m'
  export LESS_TERMCAP_md=$'\e[1;32m'
  export LESS_TERMCAP_me=$'\e[0m'
  export LESS_TERMCAP_se=$'\e[0m'
  export LESS_TERMCAP_so=$'\e[01;33m'
  export LESS_TERMCAP_ue=$'\e[0m'
  export LESS_TERMCAP_us=$'\e[1;4;31m'
fi

# zsh history
export HISTFILE=$HOME/.zsh_history

## ibus-hangul
# local ostype=$(uname | tr '[:upper:]' '[:lower:]')
# if [ $ostype = 'linux' ]; then
#   export GTK_IM_MODULE=ibus
#   export XMODIFIERS=@im=ibus
#   export QT_IM_MODULE=ibus
# fi

## fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden --column --line-number --no-heading --smart-case --glob "!.git/*"'
export FZF_DEFAULT_OPTS='--reverse --cycle --height=40%'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_CTRL_T_OPTS=$FZF_DEFAULT_OPTS
export FZF_ALT_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_ALT_T_OPTS=$FZF_DEFAULT_OPTS

# vim:ft=zsh:nowrap

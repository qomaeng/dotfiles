# Lines configured by zsh-newuser-install                                                                     
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/qo/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Prompt
autoload -Uz promptinit
promptinit
prompt pure

# Directory colors
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)

# ibus-hangul
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

# Alias
alias vi='vim'
alias ls='ls --color=auto'
alias l='ls -l'
alias ll='ls -la'

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

eval "$(pyenv init -)"


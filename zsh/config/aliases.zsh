##
## Aliases
##

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias cd.='cd ..'
alias cd..='cd ../..'
alias ls='exa --color=auto --icons'
alias l='ls -l'
alias ll='ls -la'
alias lt="ls --tree"
alias vi=$EDITOR
alias vim=$EDITOR
alias bat='bat --color always --plain --theme="base16"'
alias grep='grep --color=auto'
alias ssh='TERM="xterm-256color" ssh'
alias tmux='tmux -2'
alias grub-update='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias mirror-update='sudo reflector --verbose -c "South Korea" --sort rate --latest 10 --number 5 --save /etc/pacman.d/mirrorlist'

# vim:ft=zsh

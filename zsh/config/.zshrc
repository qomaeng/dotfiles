while read file
do 
  source "$ZDOTDIR/$file.zsh"
done <<-EOF
env
options
keybinds
oh-my-zsh
aliases
startx
EOF

# vim:ft=zsh:nowrap

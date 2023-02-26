while read file
do 
  source "$ZDOTDIR/$file.zsh"
done <<-EOF
env
options
keybinds
oh-my-zsh
prompt
aliases
EOF

# vim:ft=zsh:nowrap

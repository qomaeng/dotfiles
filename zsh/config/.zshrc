while read file
do 
  source "$ZDOTDIR/$file.zsh"
done <<-EOF
env
options
keybinds
plugins/xdg
plugins/gpg
plugins/fzf
plugins/man
plugins/mise
plugins/oh-my-zsh
plugins/rust
theme
aliases
EOF

# Dotfiles

## Shell

1. vi ~/.zshrc
```sh
# shell color theme
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)
```

## Vi

1. cp -r .vimrc .vim .config ~/
2. vim
```vi
:PlugInstall
```
3. nvim
```vi
:PlugInstall
```

## Gnome Terminal

### Theme

```sh
git clone https://github.com/arcticicestudio/nord-gnome-terminal.git
cd nord-gnome-terminal/src
./nord.sh
```


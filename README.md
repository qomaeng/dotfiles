# Dotfiles

## Requirementes
- curl, wget
- tar, unzip, gzip
- awk
- bash, zsh
- vim
- cc
- git
- python
- nodejs
- rust
- golang
- [gpg](https://www.gnupg.org/): A versatile key management system
- [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep): 'grep' alternative(fast)
- [sharkdp/fd](https://github.com/sharkdp/fd): 'find' alternative(fast)
- [bat](https://github.com/sharkdp/bat): 'cat' alternative(fast, syntax highlight, git integration)
- [fzf](https://github.com/junegunn/fzf): A general-purpose command-line fuzzy finder
- [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh): A framework for managing zsh config
- [nerd-fonts](https://github.com/ryanoasis/nerd-fonts): Iconic font aggregator, collection and petcher


## Setups

### Zsh

```sh
$ ln -sr zsh/.zshrc ~/.zshrc
$ ln -sr zsh/.dir_colors ~/.dir_colors
```

### VIM

```sh
$ ln -sr vim ~/.vim
$ ln -sr vim/.vimrc ~/.vimrc
```

### asdf

```sh
$ ln -sr asdf/.tool-versions ~/.tool-versions
```

## Post-settups

```sh
$ ./script/install_tools.sh
$ ./script/install_asdf_plugins.sh
$ ./script/install_vim_plugins.sh
```


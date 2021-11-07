# Dotfiles

## Requirementes
- curl, wget
- tar, unzip, gzip
- awk
- bash, zsh
- vim, neovim
- cc
- git
- [gpg](https://www.gnupg.org/): A versatile key management system
- [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep): 'grep' alternative(fast)
- [sharkdp/fd](https://github.com/sharkdp/fd): 'find' alternative(fast)
- [bat](https://github.com/sharkdp/bat): 'cat' alternative(fast, syntax highlight, git integration)
- [fzf](https://github.com/junegunn/fzf): A general-purpose command-line fuzzy finder
- [tmux](https://github.com/tmux/tmux): A Terminal multiplexer
- [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh): A framework for managing zsh config
- [nerd-fonts](https://github.com/ryanoasis/nerd-fonts): Iconic font aggregator, collection and petcher


## Setups

### Zsh

```sh
$ ln -sr zsh/.zshrc -t ~
$ ln -sr zsh/.dir_colors -t ~
```

### Vim

```sh
$ ln -sr vim/.vim -T ~/.vim
$ ln -sr vim/.vimrc  -t ~
```

### Nvim

```sh
$ ln -sr nvim -t ~/.config/
```

### asdf

```sh
$ ln -sr asdf/.tool-versions -t ~
```


### tmux

```sh
$ ln -sr tmux/.tmux.conf -t ~

```
## Post-settups

```sh
$ ./script/install_tools.sh
$ ./script/install_asdf_plugins.sh
$ asdf install
$ ./script/install_lsp_servers.sh
$ ./script/install_vim_plugins.sh
$ ./script/install_nvim_plugins.sh
```


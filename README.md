# Dotfiles

## Requirementes
- cc
- git
- bash
- vim
- [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep): 'grep' alternative(fast)
- [sharkdp/fd](https://github.com/sharkdp/fd): 'find' alternative(fast)
- [bat](https://github.com/sharkdp/bat): 'cat' alternative(fast, syntax highlight, git integration)
- [fzf](https://github.com/junegunn/fzf): A general-purpose command-line fuzzy finder
- [zsh](https://www.zsh.org/): A improved tab completion and globbing shell
- [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh): A framework for managing zsh config


## Setups

### Zsh

```sh
$ cp ./zsh/.zshrc ~
$ cp ./zsh/.dir_colors ~
```

### VIM

```sh
$ cp ./vim/.vimrc ~
$ cp -r ./vim/.vim ~
```

## Gnome Terminal

### Theme

```sh
$ cd <folder_to_clone_git>
$ git clone --depth 1 https://github.com/arcticicestudio/nord-gnome-terminal.git
$ cd nord-gnome-terminal/src
$ ./nord.sh
```


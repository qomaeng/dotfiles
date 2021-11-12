# Dotfiles

## Requirements

- cc
- zsh
- git
- [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep): 'grep' alternative(fast)
- [sharkdp/fd](https://github.com/sharkdp/fd): 'find' alternative(fast)
- [sharkdp/bat](https://github.com/sharkdp/bat): 'cat' alternative(fast, syntax highlight, git integration)
- [junegunn/fzf](https://github.com/junegunn/fzf): A general-purpose command-line fuzzy finder
- [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh): A framework for managing zsh config
- [neovim](https://github.com/neovim/neovim): Vim-fork focused on extensibility and usability
- [alacritty](): 

## Programs to be installed

`./install.sh` script will install git repository, programs, configs, etc.

**Becareful** that after running the script below files/directories will be replaced by this dotfiles.
So before running the script you have to backup files.
- $HOME/.zshrc
- $HOME/.tmux.conf
- $HOME/.tool-versions
- $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions/
- $HOME/.zsh/pure/
- $HOME/.config/alacritty/
- $HOME/.asdf/
- $HOME/.config/nvim/
- $HOME/Pictures/wallpapers/

After running the script below programs will be installed in local using `asdf`.
- [asdf-vm/asdf](https://github.com/asdf-vm/asdf): Manage multiple runtime versions
- rust
- rust-analyzer
- golang
- gopls
- python
- pyright
- nodejs
- yarn
- typescript-language-server
- terraform
- [awscli](https://github.com/aws/aws-cli): AWS CLI to control multiple AWS service and automate them through scripts
- [k9s](https://github.com/derailed/k9s): Kubernetes CLI to manage clusters in style
- kubectl

## Tips

### Error occured when installing Neovim plugins even manual update using `PackerSync`
Reinstall after clean Nvim configs and cache.

```sh
$ rm -rf "$HOME/.config/nvim"
$ rm -rf "$HOME/.local/share/nvim"
$ rm -rf "$HOME/.cache/nvim"
```


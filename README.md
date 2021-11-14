# Dotfiles

## Requirements

- [oh-my-zsh](): 

## Programs to be installed

`./install.sh` script will install git repository, programs, configs, etc.

**Becareful** that after running the script below files/directories will be replaced by this dotfiles.
So before running the script you have to backup files.
- $HOME/.zshrc
- $HOME/.tmux.conf
- $HOME/.tool-versions
- $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions/
- $HOME/.zsh/pure/
- $HOME/.asdf/
- $HOME/.config/alacritty/
- $HOME/.config/nvim/
- $HOME/.config/alacritty/
- $HOME/.config/bspwm/
- $HOME/.config/sxhkd/
- $HOME/.config/picom/
- $HOME/.config/polybar/
- $HOME/.config/rofi/
- $HOME/.local/share/fonts/NerdFonts/
- $HOME/Pictures/wallpapers/

After running the script below packages will be installed in local.
- [oh-my-zsh](): 
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


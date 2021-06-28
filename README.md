It's just my dotfiles


## VIM plugins

- `fzf` opens files fast
- `nerdtree` an improved file tree view
- `vim-airline` improved and beautiful vim status line
- `vim-airline-themes` 
- `tagbar` 

### Vim Plugins Install Guides

1. cp -r .vimrc .vim ~/
2. vim
* :PlugInstall
3. vim ~/.bashrc
    # shell color theme
    if [ -f ~/.dir_colors ]; then
        eval $(dircolors ~/.dir_colors)
    fi

### Install Gnome Terminal theme nord
git clone https://github.com/arcticicestudio/nord-gnome-terminal.git
cd nord-gnome-terminal/src
./nord.sh


It's just my dotfiles


## VIM plugins

- `pathogen` manage vim plugins
- `ctrlp` opens files fast
- `nerdtree` an improved file tree view
- `vim-airline` improved and beautiful vim status line
- `vim-airline-themes` 
- `vim-fugitive` 
- `tagbar` 
- `vim-virtualenv` 
- `youcompleteme` auto-completion(heavy)

### Vim Plugins Install Guides

1. ./git_clone_vim_plugins.sh
2. git pull (in .vim/bundle/* plugin directories)
3. git submodule update --recursive (in .vim/bundle/youcompleteme directory)
4. cd .vim/bundle/youcompleteme && .vim/bundle/youcompleteme/install.py --clang-completer (if error occured then follow error
  messages)


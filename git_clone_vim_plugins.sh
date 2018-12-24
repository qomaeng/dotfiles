#!/bin/sh

git clone https://github.com/kien/ctrlp.vim ./.vim/bundle/ctrlp.vim
git clone https://github.com/scrooloose/nerdtree ./.vim/bundle/nerdtree
git clone https://github.com/vim-airline/vim-airline ./.vim/bundle/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes.git ./.vim/bundle/vim-airline-themes
git clone https://github.com/tpope/vim-fugitive ./.vim/bundle/vim-fugitive
git clone https://github.com/majutsushi/tagbar ./.vim/bundle/tagbar
git clone https://github.com/plytophogy/vim-virtualenv ./.vim/bundle/vim-virtualenv
git clone https://github.com/valloric/youcompleteme ./.vim/bundle/youcompleteme

cd .vim/bundle/youcompleteme && \
    git submodule update --init --recursive


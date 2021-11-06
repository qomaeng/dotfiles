set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
Plug 'arcticicestudio/nord-vim'
Plug 'junegunn/fzf'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'preservim/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()

syntax on
filetype plugin indent on

source ~/.vim/plugins/settings.vim
source ~/.vim/plugins/keymaps.vim
source ~/.vim/plugins/fzf.vim
source ~/.vim/plugins/nerdtree.vim
source ~/.vim/plugins/tagbar.vim
source ~/.vim/plugins/vim-airline.vim

" open file at last read position
augroup vim_open_at_last_read_position
  au!
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END


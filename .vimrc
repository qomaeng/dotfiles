" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
"runtime! debian.vim
"set nocompatible
"
call plug#begin('~/.vim/plugged')
Plug 'arcticicestudio/nord-vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/vim-easy-align'

Plug 'scrooloose/nerdtree'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
call plug#end()

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

set backspace=indent,eol,start

set laststatus=2
"set statusline=%f\ %l:%c\ [offset:\ %{line2byte(line('.'))-1+col('.')-1}]\ hex:\ 0x%02B

set colorcolumn=110
set textwidth=100
set wrapmargin=0
set formatoptions=cq

set encoding=utf-8

"set background=dark
colorscheme nord

"set nowrap

syntax enable
filetype plugin indent on

" indention/tabstop/shiftwidth
augroup FileTypeSpecificAutocommands
  autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
  autocmd FileType json setlocal shiftwidth=4 tabstop=4
  autocmd FileType java setlocal shiftwidth=4 tabstop=4
  autocmd FileType html setlocal shiftwidth=2 tabstop=2
  autocmd FileType tf   setlocal shiftwidth=2 tabstop=2
augroup END

set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

set ai
set smartindent

" enable folding
set foldenable
"set fdm=indent
set fdm=marker
"set fdm=syntax

" search (incremental, case insensitive except explicit caps)
set incsearch
set ignorecase
set smartcase

" we're on big screens, and I need a vertical scroll offset for better
" readability
set scrolloff=4
set sidescrolloff=15
set sidescroll=1

" line numbering to take up to 5 spaces
set nu
set numberwidth=5

set modelines=5
set modeline

" enable current cursor line/column high lighting
"set cursorline
"set cursorcolumn

set hlsearch

" function shortcuts (insert mode)
imap <F2> <ESC>:w<CR>a
imap <F9> <ESC>:q<CR>
imap jj <ESC>

" tabbed windows (command mode)
nnoremap <silent> <F2>    :w<enter>
nnoremap <silent> <F3>    :<CR>
nnoremap <silent> <F4>    :<CR>
nnoremap <silent> <F5>    :<CR>
nnoremap <silent> <F7>    :bp<CR>
nnoremap <silent> <F8>    :bn<CR>
nnoremap <silent> <F9>    :q<CR>
nnoremap <silent> <C-F9>  :bd<CR>
"nnoremap <silent> <F12> :!make<enter>

nnoremap <silent> <space> za
nnoremap <silent> <C-h>   :noh<CR>
nnoremap <silent> <C-n>   :NERDTreeToggle<CR>
nnoremap <silent> <C-p>   :FZF<CR>

nnoremap <silent> th :tabprev<CR>
nnoremap <silent> tl :tabnext<CR>
nnoremap <silent> tt :tabnew<CR>
nnoremap <silent> tc :tabclose<CR>

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

if has("autocmd")
  " open file at last read position
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


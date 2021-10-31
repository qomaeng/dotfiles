" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

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

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" Color
set t_Co=256
set background=dark
colorscheme nord

" Encoding
set encoding=utf-8

" Status bar
set laststatus=2
"set statusline=%f\ %l:%c\ [offset:\ %{line2byte(line('.'))-1+col('.')-1}]\ hex:\ 0x%02B

" Security
set nomodeline
set modelines=0

" Whitespace
set wrap
set textwidth=80
set colorcolumn=80
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

" Line number
set nu
"set numberwidth=5

" Show file status
set ruler

" Cursor motion
"set cursorline
"set cursorcolumn
set scrolloff=3
set sidescrolloff=15
set sidescroll=1
set backspace=indent,eol,start

" Last line
set showmode
set showcmd

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

" enable folding
set foldenable
"set fdm=indent
set fdm=marker
"set fdm=syntax

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

if has("autocmd")
  " open file at last read position
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


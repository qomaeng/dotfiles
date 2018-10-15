set nocompatible

execute pathogen#infect()

syntax on
filetype indent on
filetype plugin on

set mouse=a

set backspace=indent,eol,start

set laststatus=2
"set statusline=%f\ %l:%c\ [offset:\ %{line2byte(line('.'))-1+col('.')-1}]\ hex:\ 0x%02B

set colorcolumn=110
set textwidth=100
set wrapmargin=0
set formatoptions=cqt

set encoding=utf-8

colorscheme obsidian

set nowrap

" indention/tabstop/shiftwidth
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
"set ai
"set smartindent

" enable folding
set foldenable
"set fdm=indent
set fdm=marker
"set fdm=syntax

" set <space> to toggle fold
nnoremap <space> za
nmap <F2> :w<enter>
nmap <F3> :NERDTreeToggle<CR>
nmap <C-n> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F9> :q<CR>
nmap <C-h> :noh<CR>
nmap <F5> :bp<CR>
nmap <F6> :bn<CR>
"nmap <F8> :mak<enter>

" tabbed windows (command mode)
nmap <S-h> :tabprev<CR>
nmap <S-l> :tabnext<CR>
nmap <S-t> :tabnew<CR>
nmap <S-c> :tabclose<CR>

"nmap <F12> :!make<enter>

" function shortcuts (insert mode)
imap <F2> <ESC>:w<CR>a
imap <F9> <ESC>:q<CR>

imap jj <ESC>

" search (incremental, case insensitive except explicit caps)
set incsearch
"set ignorecase
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

set ai
set si
set cindent

" enable current cursor line/column high lighting
set cursorline
"set cursorcolumn

set hlsearch

" C++11 syntax highlighting fix (lamdas and initializers)
let c_no_nocurly_error=1

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

let NERDTreeIgnore = [ '\.o$', 'cmake_install.*', 'CMakeFiles', 'CMakeCache.*' ]

if has("autocmd")
  " open file at last read position
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" SECTION: Vim plugin {{{1
" =====================================================================
" Plugin: Airline {{{2
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1
let g:airline_theme='minimalist'

" Plugin: CtrlP {{{2
let g:ctrlp_show_hidden = 0

" SECTION: FileType: {{{1
" =====================================================================
" FileType: C/C++ {{{2
au FileType c,cpp set ts=4
au FileType c,cpp set sw=4
" }}}
" }}}


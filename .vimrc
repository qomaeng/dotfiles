" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim
set nocompatible

execute pathogen#infect()

filetype indent on
filetype plugin on
syntax on

set mouse=a

set backspace=indent,eol,start

set laststatus=2
"set statusline=%f\ %l:%c\ [offset:\ %{line2byte(line('.'))-1+col('.')-1}]\ hex:\ 0x%02B

set colorcolumn=110
set textwidth=100
set wrapmargin=0
set formatoptions=cqt

set encoding=utf-8

set background=dark
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
nmap <F3> :<CR>
nmap <F4> :<CR>
nmap <C-n> :NERDTreeToggle<CR>
nmap <F5> :TagbarToggle<CR>
nmap <F9> :q<CR>
nmap <C-h> :noh<CR>
nmap <F7> :bp<CR>
nmap <F8> :bn<CR>
"nmap <F8> :mak<enter>

" tabbed windows (command mode)
nmap th :tabprev<CR>
nmap tl :tabnext<CR>
nmap tt :tabnew<CR>
nmap tc :tabclose<CR>

" YouCompleteMe command (Vim Plugin)
nmap ti :YcmCompleter GoToInclude<CR>
nmap tf :YcmCompleter GoToDefinition<CR>
nmap tc :YcmCompleter GoToDeclaration<CR>
nmap <F10> :YcmDiags<CR>
imap <F10> <ESC>:YcmDiags<CR>

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

" enable current cursor line/column high lighting
"set cursorline
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

" Plugin: YouCompleteMe {{{2
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_key_invoke_completion = '<C-Space>'

let g:ycm_goto_buffer_command = 'same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]

let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_autoclose_preview_window_after_completion = 1

" SECTION: FileType: {{{1
" =====================================================================
" FileType: C/C++ {{{2
au FileType c,cpp set ts=4
au FileType c,cpp set sw=4
" }}}
" }}}

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


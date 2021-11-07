" Color
set t_Co=256
set background=dark
colorscheme nord

set wildmenu
set wildmode=longest:full
set completeopt=menu,menuone,noselect

set noshowmode
set showcmd
set cmdheight=1
set hlsearch
set incsearch " Makes search act like search in modern browsers
set noshowmatch " show matching brackets when text indicator is over them
set relativenumber " Show line numbers
set number " But show the actual number for the line we're on
set ignorecase " Ignore case when searching...
set smartcase " ... unless there is a capital letter in the query
set hidden " I like having buffers stay around
set cursorline " Highlight the current line
set noequalalways " I don't like my windows changing all the time
set splitright " Prefer windows splitting to the right
set splitbelow " Prefer windows splitting to the bottom
set updatetime=100 " Make updates happen faster
set scrolloff=3
set sidescrolloff=15
set sidescroll=1

" Tab and indent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set cindent
set nowrap
set breakindent
set showbreak=\ \ \  " Make it so that long lines wrap smartly
set linebreak

" Fold
set foldmethod=marker
set foldlevel=0
set foldlevelstart=99 " always start editing with all folds closed (value zero), some folds closed (one) or no folds closed (99).
set modelines=0

set belloff=all " Just turn the dang bell off

set clipboard=unnamedplus
set shortmess+=c

set swapfile
set viminfo=!,'1000,<100,s100,h

set mouse=

"set formatoptions

set nojoinspaces


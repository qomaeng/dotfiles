" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

call plug#begin('~/.config/nvim/plugged')
Plug 'arcticicestudio/nord-vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/vim-easy-align'

Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'rust-lang/rust.vim'
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
set viminfo='10,\"100,:20,%,n~/.nviminfo

set updatetime=100
set completeopt=menu,menuone,noselect

" Color
set t_Co=256
set background=dark
colorscheme nord

" Encoding
set encoding=utf-8

" Status bar
set laststatus=2
"set statusline=%f\ %l:%c\ [offset:\ %{line2byte(line('.'))-1+col('.')-1}]\ hex:\ 0x%02B

"  Security
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
nnoremap <silent> <F3>    :TagbarToggle<CR>
nnoremap <silent> <F4>    :<CR>
nnoremap <silent> <F5>    :make b<CR>
" <F17> == <C-F5>
nnoremap <silent> <F17>   :make r<CR>
" <F29> == <S-F5>
nnoremap <silent> <F29>   :make t<CR>
nnoremap <silent> <F7>    :bp<CR>
nnoremap <silent> <F8>    :bn<CR>
nnoremap <silent> <F9>    :q<CR>
" <F33> == <C-F9>
nnoremap <silent> <F33>   :bd<CR>

nnoremap <silent> <space> za
nnoremap <silent> <C-h>   :noh<CR>
nnoremap <silent> <C-n>   :NERDTreeToggle<CR>
nnoremap <silent> <C-p>   :FZF<CR>

nnoremap <silent> th :tabprev<CR>
nnoremap <silent> tl :tabnext<CR>
nnoremap <silent> tt :tabnew<CR>
nnoremap <silent> tc :tabclose<CR>

" See `:help vim.lsp.*` for documentation on any of the below functions
nnoremap <silent> gD        <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gd        <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K         <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi        <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <C-k>     <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <space>wa <cmd>lua vim.lsp.buf.add_workspace_folder()<CR>
nnoremap <silent> <space>wr <cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>
nnoremap <silent> <space>wl <cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>
nnoremap <silent> <space>D  <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> <space>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <space>ca <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> gr        <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <space>e  <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <silent> [d        <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> ]d        <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> <space>q  <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap <silent> <space>f  <cmd>lua vim.lsp.buf.formatting()<CR>

lua << EOF
  local nvim_lsp = require('lspconfig')

  -- Setup lspconfig.
  local cmp_nvim_lsp = require('cmp_nvim_lsp')
  local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

  nvim_lsp['pyright'].setup {
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }

  nvim_lsp['rust_analyzer'].setup {
    capabilities = capabilities,
    settings = {
      ["rust-analyzer"] = {
        -- checkOnSave = {
        --   command = "clippy"
        -- },
      }
    },
    flags = {
      debounce_text_changes = 150,
    }
  }

  nvim_lsp['gopls'].setup {
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }

  nvim_lsp['tsserver'].setup {
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }

  -- Setup nvim-cmp.
  local cmp = require('cmp')

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/`.
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':'.
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
EOF

if has("autocmd")
  " open file at last read position
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


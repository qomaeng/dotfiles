vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require'packer'.startup({function()
  -- Package Manager
  use {'wbthomason/packer.nvim'}

  -- Colorscheme
  use {'arcticicestudio/nord-vim', opt = true}

  use {'nvim-treesitter/nvim-treesitter'}

  -- A lua fork of vim-devicons
  use {'kyazdani42/nvim-web-devicons'}

  use {'scrooloose/nerdtree', cmd = {'NERDTree*'}}
  use {'majutsushi/tagbar', cmd = {'Tagbar*'}}

  -- A highly extendable fuzzy finder
  use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}}
  -- FZF sorter for telescope written in c
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Git
  use {'tpope/vim-fugitive'}
  use {'airblade/vim-gitgutter'}

  -- LSP(Language Server Protocol)
  use {'neovim/nvim-lspconfig'}

  use {'rust-lang/rust.vim', ft = {'rust'}}

  --use {'hrsh7th/cmp-nvim-lsp'}
  --use {'hrsh7th/cmp-buffer'}
  --use {'hrsh7th/cmp-path'}
  --use {'hrsh7th/cmp-cmdline'}
  --use {'hrsh7th/nvim-cmp'}
  --use {'hrsh7th/cmp-vsnip'}
  --use {'hrsh7th/vim-vsnip'}
  --use {'nvim-lua/popup.nvim'}
  --use {'mfussenegger/nvim-dap'}

  --use {'simrat39/rust-tools.nvim', ft = {'rust'}}

  config = {}
end})


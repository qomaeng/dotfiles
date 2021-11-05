vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require'packer'.startup({function()
  -- Package Manager
  use {"wbthomason/packer.nvim"}

  -- Theme
  use {'arcticicestudio/nord-vim', opt = true}

  -- File Manager
  use {'scrooloose/nerdtree', cmd = {'NERDTree*'}}
  use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}}

  -- Git
  use {'tpope/vim-fugitive'}
  use {'airblade/vim-gitgutter'}

  -- LSP(Language Server Protocol)
  use {'neovim/nvim-lspconfig'}

  -- Programming Language
  use {'rust-lang/rust.vim', ft = {'rust'}}

  -- Programming Tools
  use {'nvim-treesitter/nvim-treesitter'}
  use {'majutsushi/tagbar', cmd = {'Tagbar*'}}

  use {'nvim-telescope/telescope.nvim'}

  --use {'hrsh7th/cmp-nvim-lsp'}
  --use {'hrsh7th/cmp-buffer'}
  --use {'hrsh7th/cmp-path'}
  --use {'hrsh7th/cmp-cmdline'}
  --use {'hrsh7th/nvim-cmp'}
  --use {'hrsh7th/cmp-vsnip'}
  --use {'hrsh7th/vim-vsnip'}
  --use {'nvim-lua/popup.nvim'}
  --use {'nvim-lua/plenary.nvim'}
  --use {'mfussenegger/nvim-dap'}

  --use {'simrat39/rust-tools.nvim', ft = {'rust'}}

  config = {}
end})


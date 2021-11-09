vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require'packer'.startup({function()
  -- Package Manager
  use 'wbthomason/packer.nvim'

  -- Syntax
  use 'nvim-treesitter/nvim-treesitter'

  -- Colorscheme
  use {'arcticicestudio/nord-vim',
    config = function() vim.cmd('colorscheme nord') end,
  }

  -- Icon
  use 'kyazdani42/nvim-web-devicons' -- A lua fork of vim-devicons

  use {'majutsushi/tagbar', cmd = {'Tagbar*'}}

  -- Fuzzy finder
  use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}} -- A highly extendable fuzzy finder
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } -- FZF sorter for telescope written in c

  -- Git
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'
  -- use 'kdheepak/lazygit.nvim'
  -- use 'pwntester/octo.nvim'

  -- LSP(Language Server Protocol)
  use 'neovim/nvim-lspconfig'

  -- Auto completions
  use {'hrsh7th/nvim-cmp', -- Autocompletion plugin
    requires = {
      'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
      'hrsh7th/cmp-buffer', -- buffer completion source for nvim-cmp
      'hrsh7th/cmp-path', -- path completion source for nvim-cmp
      'hrsh7th/cmp-cmdline', -- command completion source for nvim-cmp
      'saadparwaiz1/cmp_luasnip', -- luasnip completion source for nvim-cmp
    }
  }

  -- Snippets
  use 'L3MON4D3/LuaSnip'

  -- Utility
  use 'rcarriga/nvim-notify'

  -- Tabline
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

  -- Statusline
  use {
      'famiu/feline.nvim',
      after = 'nvim-web-devicons',
      config = function() require'feline'.setup{preset='noicon'} end,
   }

  -- Indent
  use "lukas-reineke/indent-blankline.nvim"

  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end
  }

  -- Language Supports
  use {'rust-lang/rust.vim', ft = {'rust'}}
  --use {'simrat39/rust-tools.nvim', ft = {'rust'}}

  config = {}
end})


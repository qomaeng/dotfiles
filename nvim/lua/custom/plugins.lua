local overrides = require "custom.configs.overrides"

local plugins = {
  -- Override NvChad Plugins
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },
  {
    "hrsh7th/nvim-cmp",
    -- opts = overrides.cmp,
    opts = function()
      local cmp = require "cmp"
      local M = require "plugins.configs.cmp"

      table.insert(M.sources, { name = "crates" })

      M.mapping["<Tab>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      }
      M.mapping["<CR>"] = {}

      return M
    end,
  },

  -- Override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install Plugins
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "nathom/filetype.nvim",
    overrides = {
      extensions = {
        tf = "terraform",
        tfvars = "terraform-vars",
        tfstate = "json",
      },
    },
  },
  {
    "easymotion/vim-easymotion",
    lazy = false,
  },
  {
    "saecki/crates.nvim",
    dependencies = "hrsh7th/nvim-cmp",
    ft = { "rust", "toml" },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      crates.show()
    end,
  },
  -- {
  --   "mfussenegger/nvim-dap"
  -- },
}

return plugins

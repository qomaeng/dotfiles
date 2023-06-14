local M = {}

M.general = {
  i = {
    ["jk"] = { "<ESC>", "leave insert mode" },
  },

  n = {
    ["f"] = { "<Plug>(easymotion-s2)", "Multi input find motion" },
  },
}

M.tabufline = {
  n = {
    ["<C-x>"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "close buffer",
    },
  },
}

M.lspconfig = {
  n = {
    ["]d"] = {
      function()
        vim.diagnostic.goto_next()
      end,
      "goto_next",
    },
  },
}

-- M.cmp = {
--   n = {
--     ["<Tab>"] = cmp.mapping.confirm({
--       behavior = cmp.ConfirmBehavior.Replace,
--       select = false,
--     }),
--     ["<CR>"] = {},
--   }
-- }

M.crates = {
  n = {
    ["<leader>rcu"] = {
      function()
        require("crates").upgrade_all_crates()
      end,
      "update crates",
    },
  },
}

return M

local M = {}

M.general = {
  i = {
    ["jk"] = { "<ESC>", "leave insert mode" },
  },

  n = {
    ["f"] = { "<Plug>(easymotion-s2)", "Multi input find motion" }
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

return M
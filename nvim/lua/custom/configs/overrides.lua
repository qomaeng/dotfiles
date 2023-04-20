local M = {}

local cmp = require "cmp"

M.cmp = {
  mapping = {
    ["<Tab>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    ["<CR>"] = {}
  },
}

return M

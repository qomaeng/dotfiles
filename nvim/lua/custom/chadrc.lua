local M = {}

local highlights = require "custom.highlights"

M.ui = {
  theme = "nord",
  theme_toggle = { "onedark", "nord" },

  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M

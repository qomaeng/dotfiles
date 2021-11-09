vim.opt.termguicolors = true

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<C-n>', ':NvimTreeToggle<CR>', opts)

vim.g.nvim_tree_icons = {
  default = ''
--  symlink = ,
--  git = {
--    unstaged = "✗",
--    staged = "✓",
--    unmerged = "",
--    renamed = "➜",
--    untracked = "★",
--    deleted = "",
--    ignored = "◌"
--  },
--  folder = {
--    arrow_open = "",
--    arrow_closed = "",
--    default = "",
--    open = "",
--    empty = "",
--    empty_open = "",
--    symlink = "",
--    symlink_open = "",
--  }
}

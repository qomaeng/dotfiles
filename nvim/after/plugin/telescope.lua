local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<leader>ff', '<CMD>Telescope find_files<CR>', opts)
map('n', '<leader>fg', '<CMD>Telescope live_grep<CR>', opts)
map('n', '<leader>fb', '<CMD>Telescope buffers<CR>', opts)
map('n', '<leader>fh', '<CMD>Telescope help_tags<CR>', opts)


local map = vim.api.nvim_set_keymap
local opts = { silent = true }

map('n', 'ghs', '<Plug>(GitGutterStageHunk)', opts)
map('n', 'ghu', '<Plug>(GitGutterUndoHunk)', opts)
map('n', 'ghp', '<Plug>(GitGutterPreviewHunk)', opts)


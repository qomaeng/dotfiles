vim.opt.termguicolors = true

require'bufferline'.setup {
  offsets = {
    {
      filetype = 'NvimTree',
      text = 'File Explorer',
      highlight = 'Directory',
      text_align = 'center'
    }
  }
}

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- These commands will navigate through buffers in order regardless of which mode you are using
-- e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
map('n', '<A-.>', ':BufferLineCycleNext<CR>', opts)
map('n', '<A-,>', ':BufferLineCyclePrev<CR>', opts)

-- These commands will move the current buffer backwards or forwards in the bufferline
map('n', '<A->>', ':BufferLineMoveNext<CR>', opts)
map('n', '<A-<>', ':BufferLineMovePrev<CR>', opts)

map('n', '<A-1>', ':BufferLineGoToBuffer 1<CR>', opts)
map('n', '<A-2>', ':BufferLineGoToBuffer 2<CR>', opts)
map('n', '<A-3>', ':BufferLineGoToBuffer 3<CR>', opts)
map('n', '<A-4>', ':BufferLineGoToBuffer 4<CR>', opts)
map('n', '<A-5>', ':BufferLineGoToBuffer 5<CR>', opts)
map('n', '<A-6>', ':BufferLineGoToBuffer 6<CR>', opts)
map('n', '<A-7>', ':BufferLineGoToBuffer 7<CR>', opts)
map('n', '<A-8>', ':BufferLineGoToBuffer 8<CR>', opts)
map('n', '<A-9>', ':BufferLineGoToBuffer 9<CR>', opts)

map('n', '<A-c>', ':bdelete<CR>', opts)

-- These commands will sort buffers by extension, directory, language, or a custom criteria
map('n', '<leader>be', ':BufferLineSortByExtension<CR>', opts)
map('n', '<leader>bd', ':BufferLineSortByDirectory<CR>', opts)
map('n', '<leader>bl', ':lua require("bufferline").sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>', opts)


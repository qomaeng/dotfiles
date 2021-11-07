local opt = vim.opt

opt.encoding = 'utf-8'

-- Ignore compiled files
opt.wildignore = { '__pycache__', '*.o', '*~', '*.pyc', '*pycache*' }

-- Cool floating window popup menu for completion on command line
opt.pumblend = 17
opt.wildmode = 'longest:full'
opt.wildoptions = 'pum'
opt.completeopt = {'menu', 'menuone', 'noselect'}

opt.showmode = false
opt.showcmd = true
opt.cmdheight = 1 -- Height of the command bar
opt.hlsearch = true -- 
opt.incsearch = true -- Makes search act like search in modern browsers
opt.showmatch = false -- show matching brackets when text indicator is over them
opt.relativenumber = true -- Show line numbers
opt.number = true -- But show the actual number for the line we're on
opt.ignorecase = true -- Ignore case when searching...
opt.smartcase = true -- ... unless there is a capital letter in the query
opt.hidden = true -- I like having buffers stay around
opt.cursorline = true -- Highlight the current line
opt.equalalways = false -- I don't like my windows changing all the time
opt.splitright = true -- Prefer windows splitting to the right
opt.splitbelow = true -- Prefer windows splitting to the bottom
opt.updatetime = 300 -- Make updates happen faster
opt.scrolloff = 3
opt.sidescrolloff = 15
opt.sidescroll = 1

-- Tab and indent
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.autoindent = true
opt.cindent = true
opt.wrap = false

opt.breakindent = true
opt.showbreak = string.rep(' ', 3) -- Make it so that long lines wrap smartly
opt.linebreak = true

opt.foldmethod = 'marker'
opt.foldlevel = 0
opt.foldlevelstart = 99 -- always start editing with all folds closed (value zero), some folds closed (one) or no folds closed (99).
opt.modelines = 0

opt.belloff = 'all' -- Just turn the dang bell off

opt.clipboard = 'unnamedplus'
opt.shortmess = opt.shortmess + 'c'

opt.inccommand = 'split'
opt.swapfile = true
opt.shada = { '!', '\'1000', '<100', 's100', 'h' }

opt.mouse = ''

opt.formatoptions = opt.formatoptions

-- set joinspaces
opt.joinspaces = false

vim.cmd [[
  augroup nvim_open_at_last_read_position
    au! * <buffer>
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  augroup END
]]


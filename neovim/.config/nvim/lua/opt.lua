-- Show line numbers
vim.opt.number = true

-- Make tabs 4 spaces long
vim.opt.tabstop = 4

-- Relative line numbers
vim.opt.relativenumber = true

-- Fill chars
vim.opt.fillchars = { eob = ' ' }

-- Hide mode
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim
vim.opt.clipboard = 'unnamedplus'

-- save undo history
vim.opt.undofile = true

-- Ignore case in search
vim.opt.ignorecase = true
-- vim.opt.smartcase = true

-- Decrease update time
vim.opt.updatetime = 250

-- Always show sign columns
vim.opt.signcolumn = 'yes'

-- Show cursor line
vim.opt.cursorline = true

-- Make cursor block
vim.opt.guicursor = ''

-- Set scroll buffer when going up and down
vim.opt.scrolloff = 10

-- Decrese mapped sequence wait time
vim.opt.timeoutlen = 300

-- Hightlight search
vim.opt.hlsearch = true

-- Wildmenu
vim.opt.wildoptions = 'fuzzy'

-- Hidden
vim.opt.hidden = false

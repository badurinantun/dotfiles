-- [[ OPTIONS ]]

-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable terminal GUI colors
vim.opt.termguicolors = false

-- Hide number
vim.opt.number = false

-- Show ruler
vim.opt.ruler = true

-- Show mode
vim.opt.showmode = true

-- Sync clipboard between OS and Neovim
vim.opt.clipboard = 'unnamedplus'

-- Decrease update time
vim.opt.updatetime = 250

-- Set scroll buffer when going up and down
vim.opt.scrolloff = 10

-- Make cursor block
vim.opt.guicursor = ''

-- Hightlight search
vim.opt.hlsearch = true

-- Wildmenu
vim.opt.wildoptions = 'fuzzy'

-- Hidden
vim.opt.hidden = false

-- Decrese mapped sequence wait time
vim.opt.timeoutlen = 300

-- Disable mouse
vim.opt.mouse = ''

-- Tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4


-- Netrw
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

--[[ KEYMAPS ]]

vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = 'Close' })

-- Clear search highlights
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Explorer
vim.keymap.set('n', '<leader>e', ':Ex<CR>', { desc = 'Explorer' })






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


--[[ PLUGINS ]]

-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'

---@diagnostic disable-next-line: undefined-field
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    'https://github.com/echasnovski/mini.nvim', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end


require('mini.deps').setup({ path = { package = path_package } })

require('mini.notify').setup()
require('mini.basics').setup()
require('mini.pairs').setup()

vim.cmd("filetype off")
vim.cmd("syntax off")
		







-- [[ OPTIONS ]]

-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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

-- Always show signcolumn
vim.opt.signcolumn = 'yes'

-- Hightlight search
vim.opt.hlsearch = true

-- Wildmenu
vim.opt.wildoptions = 'fuzzy'

-- Hidden
vim.opt.hidden = false

-- Disable mouse
vim.opt.mouse = ''

-- Tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Disable Netrw
vim.g.loaded_netrw = 1

--[[ KEYMAPS ]]

-- Clear search highlights
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = 'Close' })
vim.keymap.set('n', '<leader>e', ':lua MiniFiles.open()<CR>', { desc = 'Explorer' })
vim.keymap.set('n', '<leader>p', ':Pick files<CR>', { desc = 'Project files' })
vim.keymap.set('n', '<leader>b', ':Pick buffers<CR>', { desc = 'Buffers' })
vim.keymap.set('n', '<leader>h', ':Pick help<CR>', { desc = 'Help' })
vim.keymap.set('n', '<leader>f', ':Pick grep_live<CR>', { desc = 'Grep' })

--[[ PLUGINS ]]

local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.deps'
if not vim.loop.fs_stat(mini_path) then
	vim.cmd('echo "Installing `mini.nvim`" | redraw')
	local clone_cmd = {
		'git', 'clone', '--filter=blob:none',
		'https://github.com/echasnovski/mini.deps', mini_path
	}
	vim.fn.system(clone_cmd)
	vim.cmd('packadd mini.deps | helptags ALL')
	vim.cmd('echo "Installed `mini.deps`" | redraw')
end

local MiniDeps = require('mini.deps')

MiniDeps.setup({ path = { package = path_package } })

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
	add({ source = 'echasnovski/mini.notify', checkout = 'stable' })
	add({ source = 'echasnovski/mini.ai', checkout = 'stable' })
	add({ source = 'echasnovski/mini.comment', checkout = 'stable' })
	add({ source = 'echasnovski/mini.pick', checkout = 'stable' })
	add({ source = 'echasnovski/mini.surround', checkout = 'stable' })
	add({ source = 'echasnovski/mini.files', checkout = 'stable' })

	require('mini.notify').setup()
	vim.notify = require('mini.notify').make_notify()
end)

later(function()
	vim.cmd('colorscheme quiet')
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "CursorLine", { link = "Visual" })
end)

later(function()
	require('mini.ai').setup()
	require('mini.comment').setup()
	require('mini.pick').setup()
	require('mini.files').setup()
	require('mini.surround').setup()

	vim.api.nvim_set_hl(0, "MiniPickBorder", { bg = "none" })
	vim.api.nvim_set_hl(0, "MiniFilesBorder", { bg = "none" })
end)

later(function()
	add({ source = 'nvim-treesitter/nvim-treesitter',
		-- Use 'master' while monitoring updates in 'main'
		checkout = 'master',
		monitor = 'main',
		hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
	})
	require('nvim-treesitter.configs').setup({
		ensure_installed = { 'lua', 'vimdoc' },
		auto_install = true,
		highlight = { enable = true },
	})
end)

later(function()
	add({source = 'nvim-orgmode/orgmode', checkout = 'master'})

	require('orgmode').setup({
      org_agenda_files = '~/orgfiles/**/*',
      org_default_notes_file = '~/orgfiles/refile.org',
    })
end)


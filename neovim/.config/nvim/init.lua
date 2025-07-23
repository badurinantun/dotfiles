-- [[ OPTIONS ]]

-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Nerd fonts
vim.g.have_nerd_font = true

-- Use terminal colors
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

-- Make tabs 4 spaces long
vim.opt.tabstop = 4

-- Decrese mapped sequence wait time
vim.opt.timeoutlen = 300

-- Disable mouse
vim.opt.mouse = ''

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

require('mini.basics').setup()

require('mini.notify').setup()

local miniclue = require('mini.clue')

miniclue.setup({
  triggers = {
    -- Leader triggers
    { mode = 'n', keys = '<Leader>' },
    { mode = 'x', keys = '<Leader>' },

    -- Built-in completion
    { mode = 'i', keys = '<C-x>' },

    -- `g` key
    { mode = 'n', keys = 'g' },
    { mode = 'x', keys = 'g' },

    -- Marks
    { mode = 'n', keys = "'" },
    { mode = 'n', keys = '`' },
    { mode = 'x', keys = "'" },
    { mode = 'x', keys = '`' },

    -- Registers
    { mode = 'n', keys = '"' },
    { mode = 'x', keys = '"' },
    { mode = 'i', keys = '<C-r>' },
    { mode = 'c', keys = '<C-r>' },

    -- Window commands
    { mode = 'n', keys = '<C-w>' },

    -- `z` key
    { mode = 'n', keys = 'z' },
    { mode = 'x', keys = 'z' },
  },

  clues = {
    -- Enhance this by adding descriptions for <Leader> mapping groups
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.windows(),
    miniclue.gen_clues.z(),
  },
})

local add, now = MiniDeps.add, MiniDeps.now

add('tpope/vim-sleuth')

now(function()
  add({
    source = 'nvim-treesitter/nvim-treesitter',
    hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
  })

  require('nvim-treesitter.configs').setup({
    ensure_installed = { 'bash', 'c', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'vim', 'vimdoc' },
    sync_install = true,
    ignore_install = {},
    autotag = true,
    auto_install = true,
    highlight = {
      enable = true,
    },
    indent = { enable = false },
    modules = {}
  })
end)

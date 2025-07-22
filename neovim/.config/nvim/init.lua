-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Nerd fonts
vim.g.have_nerd_font = true

-- options
require 'opt'

-- keymaps
require 'keymap'

vim.lsp.enable {
  'lua_ls',
}

-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'

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

-- Set up 'mini.deps' 
require('mini.deps').setup({ path = { package = path_package } })


require('mini.notify').setup()

MiniDeps.add('tpope/vim-sleuth')

MiniDeps.add({
  source = 'nvim-treesitter/nvim-treesitter',
  -- Use 'master' while monitoring updates in 'main'
  checkout = 'master',
  monitor = 'main',
  -- Perform action after every checkout
  hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
})

require('nvim-treesitter.configs').setup({
  ensure_installed = {  'bash', 'c', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'vim', 'vimdoc' },
  autotag = true,
  auto_install = true,
  highlight = {
    enable = true,
  },
  indent = { enable = false },
})


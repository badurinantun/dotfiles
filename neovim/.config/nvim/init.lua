require('clean').clean_plugins()

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


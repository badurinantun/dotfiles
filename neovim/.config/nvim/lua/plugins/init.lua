return {
  -- detect tabstop and shiftwidth
  'tpope/vim-sleuth',
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    config = function()
      local wk = require 'which-key'

      wk.setup {}

      wk.register({
        h = {
          name = 'Harpoon',
        },
        n = {
          name = 'Neorg',
        },
        d = {
          name = 'Document',
        },
        p = {
          name = 'Project',
        },
      }, {
        prefix = '<leader>',
      })
    end,
  },
  {
    'Aasim-A/scrollEOF.nvim',
    event = { 'CursorMoved', 'WinScrolled' },
    opts = {},
  },
  {
    'mbbill/undotree',
    init = function()
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Undotree' })
    end,
  },
}

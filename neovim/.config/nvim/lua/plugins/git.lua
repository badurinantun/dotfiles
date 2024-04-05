return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration
      'nvim-telescope/telescope.nvim', -- optional
    },
    config = function()
      local neogit = require 'neogit'
      neogit.setup {
        graph_style = 'unicode',
        ---@diagnostic disable-next-line: assign-type-mismatch
        kind = 'replace',
      }
      vim.keymap.set('n', '<leader>g', function()
        neogit.open {}
      end, { desc = 'Neogit' })
    end,
  },
}

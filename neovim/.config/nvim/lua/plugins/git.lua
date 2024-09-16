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
      'sindrets/diffview.nvim', -- diff integration
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      local neogit = require 'neogit'
      neogit.setup {
        disable_hint = true,
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

return {
  {
    'vhyrro/luarocks.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-neotest/nvim-nio',
      'nvim-neorg/lua-utils.nvim',
      'nvim-lua/plenary.nvim',
    },
    priority = 1000,
    config = true,
  },
  {
    'nvim-neorg/neorg',
    dependencies = { 'luarocks.nvim' },
    lazy = false,
    version = '*',
    config = function()
      require('neorg').setup {
        load = {
          ['core.defaults'] = {},
          ['core.esupports.metagen'] = {
            config = {
              type = 'empty',
              template = {
                {
                  'title',
                  function()
                    return vim.fn.expand '%:p:t:r'
                  end,
                },
                { 'description', '' },
                { 'categories', '' },
              },
            },
          },
          ['core.completion'] = { config = { engine = 'nvim-cmp', name = '[Norg]' } },
          ['core.integrations.nvim-cmp'] = {},
          ['core.concealer'] = { config = { folds = false, icon_preset = 'diamond' } },
          ['core.keybinds'] = {
            config = {
              default_keybinds = true,
              neorg_leader = '<Leader>',
            },
          },
          ['core.summary'] = {},
          ['core.dirman'] = {
            config = {
              workspaces = {
                notes = '~/notes',
              },
              default_workspace = 'notes',
            },
          },
        },
      }

      vim.keymap.set('n', '<leader>ni', '<cmd>Neorg index<CR>', { desc = 'Index file' })
      vim.keymap.set('n', '<leader>nq', '<cmd>Neorg return<CR>', { desc = 'Quit' })
    end,
  },
}

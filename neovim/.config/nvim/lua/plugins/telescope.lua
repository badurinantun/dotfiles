local utils = require 'utils'

return {
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-tree/nvim-web-devicons', enabled = true },
    },
    config = function()
      require('telescope').setup {
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Find files' })
      vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Buffers' })
      vim.keymap.set('n', '<leader>dd', builtin.diagnostics, { desc = 'Diagnostics' })
      vim.keymap.set('n', '<leader>pd', function()
        builtin.diagnostics { hide_filename = false, get_all = true }
      end, { desc = 'Diagnostics' })
      vim.keymap.set('n', '<leader>K', builtin.keymaps, { desc = 'Keymaps' })
      vim.keymap.set('n', '<leader>/', builtin.live_grep, { desc = 'Live grep' })
      vim.keymap.set('n', '<leader>:', builtin.commands, { desc = 'Commands' })
      vim.keymap.set('n', '<leader>?', builtin.help_tags, { desc = 'Help tags' })

      vim.keymap.set('n', '<leader>s', function()
        local word = vim.fn.expand '<cword>'
        builtin.grep_string {
          word = word,
        }
      end, { desc = 'Find word' })

      vim.keymap.set('n', '<leader>F', function()
        builtin.find_files {
          hidden = true,
          no_ignore = true,
        }
      end, { desc = 'Find all files' })

      vim.api.nvim_create_autocmd('VimEnter', {
        pattern = '*',
        callback = function()
          if utils.show_telescope_on_startup() then
            vim.cmd 'Telescope find_files'
          end
        end,
      })
    end,
  },
}

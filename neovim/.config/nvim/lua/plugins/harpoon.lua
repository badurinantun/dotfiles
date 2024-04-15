return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      -- Append
      local harpoon = require 'harpoon'

      vim.keymap.set('n', '<leader>ha', function()
        harpoon:list():add()
      end, { desc = 'Add' })

      -- Remove
      vim.keymap.set('n', '<leader>hr', function()
        harpoon:list():remove()
      end, { desc = 'Remove' })

      -- Clear
      vim.keymap.set('n', '<leader>hc', function()
        harpoon:list():clear()
      end, { desc = 'Clear' })

      -- Harpoon menu
      vim.keymap.set('n', '<C-h>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'Harpoon list' })

      -- Previous
      vim.keymap.set('n', '[h', function()
        harpoon:list():prev()
      end, { desc = 'Harpoon previous' })

      -- Next
      vim.keymap.set('n', ']h', function()
        harpoon:list():next()
      end, { desc = 'Harpoon next' })

      -- Quick select
      vim.keymap.set('n', '<leader>hh', function()
        harpoon:list():select(1)
      end, { desc = 'Select 1' })
      vim.keymap.set('n', '<leader>hj', function()
        harpoon:list():select(2)
      end, { desc = 'Select 2' })
      vim.keymap.set('n', '<leader>hk', function()
        harpoon:list():select(3)
      end, { desc = 'Select 3' })
      vim.keymap.set('n', '<leader>hl', function()
        harpoon:list():select(4)
      end, { desc = 'Select 4' })
    end,
  },
}

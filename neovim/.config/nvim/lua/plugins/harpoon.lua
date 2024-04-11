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
      end, { desc = 'Harpoon add' })

      -- Remove
      vim.keymap.set('n', '<leader>hr', function()
        harpoon:list():remove()
      end, { desc = 'Harpoon remove' })

      -- Clear
      vim.keymap.set('n', '<leader>hc', function()
        harpoon:list():clear()
      end, { desc = 'Harpoon clear' })

      -- Harpoon menu
      vim.keymap.set('n', '<C-h>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      -- Previous
      vim.keymap.set('n', '<leader>hp', function()
        harpoon:list():prev()
      end, { desc = 'Harpoon previous' })

      -- Next
      vim.keymap.set('n', '<leader>hn', function()
        harpoon:list():next()
      end, { desc = 'Harpoon next' })

      -- Quick select
      vim.keymap.set('n', '<leader>hh', function()
        harpoon:list():select(1)
      end)
      vim.keymap.set('n', '<leader>hj', function()
        harpoon:list():select(2)
      end)
      vim.keymap.set('n', '<leader>hk', function()
        harpoon:list():select(3)
      end)
      vim.keymap.set('n', '<leader>hl', function()
        harpoon:list():select(4)
      end)
    end,
  },
}

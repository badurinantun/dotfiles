local utils = require 'utils'

local function isnt_normal_buffer()
  return vim.bo.buftype ~= ''
end

return {
  {
    'echasnovski/mini.nvim',
    event = function()
      -- prevents status line flashing before telescope opens on the startups
      if utils.show_telescope_on_startup() then
        return 'VeryLazy'
      end

      return 'VimEnter'
    end,
    config = function()
      require('mini.ai').setup { n_lines = 500 }
      require('mini.basics').setup {
        mappings = {
          move_with_alt = true,
        },
      }
      require('mini.bracketed').setup()
      require('mini.comment').setup()
      require('mini.jump').setup()
      require('mini.surround').setup()
      require('mini.pairs').setup()
      require('mini.move').setup()

      local MiniNotifty = require 'mini.notify'
      MiniNotifty.setup()
      vim.notify = MiniNotifty.make_notify {}

      local MiniBufferremove = require 'mini.bufremove'

      MiniBufferremove.setup()

      vim.keymap.set('n', '<leader>w', function()
        MiniBufferremove.delete()
      end, { desc = 'Close buffer' })

      vim.keymap.set('n', '<leader>W', function()
        local buffers = vim.api.nvim_list_bufs()
        for _, buf in ipairs(buffers) do
          MiniBufferremove.delete(buf)
        end
      end, { desc = 'Close all buffers' })

      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = true }



      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_fileinfo = function()
        local filetype = vim.bo.filetype

        if (filetype == '') or isnt_normal_buffer() then
          return ''
        end

        return string.format('%s', filetype)
      end

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end,
  },
}

local utils = require 'utils'

local CTRL_S = vim.api.nvim_replace_termcodes('<C-S>', true, true, true)
local CTRL_V = vim.api.nvim_replace_termcodes('<C-V>', true, true, true)

local modes = setmetatable({
  ['n'] = { long = 'Normal', short = 'NOR', hl = 'MiniStatuslineModeNormal' },
  ['v'] = { long = 'Visual', short = 'VIS', hl = 'MiniStatuslineModeVisual' },
  ['V'] = { long = 'V-Line', short = 'V-L', hl = 'MiniStatuslineModeVisual' },
  [CTRL_V] = { long = 'V-Block', short = 'V-B', hl = 'MiniStatuslineModeVisual' },
  ['s'] = { long = 'Select', short = 'SEL', hl = 'MiniStatuslineModeVisual' },
  ['S'] = { long = 'S-Line', short = 'S-L', hl = 'MiniStatuslineModeVisual' },
  [CTRL_S] = { long = 'S-Block', short = 'S-B', hl = 'MiniStatuslineModeVisual' },
  ['i'] = { long = 'Insert', short = 'INS', hl = 'MiniStatuslineModeInsert' },
  ['R'] = { long = 'Replace', short = 'R', hl = 'MiniStatuslineModeReplace' },
  ['c'] = { long = 'Command', short = 'CMD', hl = 'MiniStatuslineModeCommand' },
  ['r'] = { long = 'Prompt', short = '-P-', hl = 'MiniStatuslineModeOther' },
  ['!'] = { long = 'Shell', short = 'SH-', hl = 'MiniStatuslineModeOther' },
  ['t'] = { long = 'Terminal', short = 'TER', hl = 'MiniStatuslineModeOther' },
}, {
  -- By default return 'Unknown' but this shouldn't be needed
  __index = function()
    return { long = 'Unknown', short = 'U', hl = '%#MiniStatuslineModeOther#' }
  end,
})

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
      require('mini.notify').setup()
      require('mini.move').setup()

      local miniBufferremove = require 'mini.bufremove'

      miniBufferremove.setup()

      vim.keymap.set('n', '<leader>w', function()
        miniBufferremove.delete()
      end, { desc = 'Close buffer' })

      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = false }

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_mode = function()
        local mode_info = modes[vim.fn.mode()]
        local mode = mode_info.short
        return mode, mode_info.hl
      end

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_git = function()
        if isnt_normal_buffer() then
          return ''
        end
        --
        ---@diagnostic disable: undefined-field
        local head = vim.b.gitsigns_head or ''

        return string.format('%s', head)
      end

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_diagnostics = function()
        return ''
      end

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

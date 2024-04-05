return {
  {
    'mcchrish/zenbones.nvim',
    priority = 1000,
    init = function()
      local auto_dark_mode = require 'auto-dark-mode'

      auto_dark_mode.setup {
        update_interval = 1000,
        set_dark_mode = function()
          vim.api.nvim_set_option('background', 'dark')
          vim.cmd.colorscheme 'kanagawabones'
        end,
        set_light_mode = function()
          vim.cmd.colorscheme 'neobones'
        end,
      }
    end,
    dependencies = {
      'rktjmp/lush.nvim',
      'f-person/auto-dark-mode.nvim',
    },
  },
}

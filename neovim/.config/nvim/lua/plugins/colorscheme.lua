return {
  {
    'mcchrish/zenbones.nvim',
    priority = 1000,
    init = function()
      vim.api.nvim_set_option('background', 'light')
      vim.cmd.colorscheme 'neobones'
    end,
    dependencies = {
      'rktjmp/lush.nvim',
    },
  },
}

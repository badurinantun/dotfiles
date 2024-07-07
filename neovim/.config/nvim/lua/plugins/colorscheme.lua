return {
  {
    'mcchrish/zenbones.nvim',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'kanagawabones'
    end,
    dependencies = {
      'rktjmp/lush.nvim',
    },
  },
}

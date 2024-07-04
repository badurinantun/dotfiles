return {
  {
    'mcchrish/zenbones.nvim',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'vimbones'
    end,
    dependencies = {
      'rktjmp/lush.nvim',
    },
  },
}

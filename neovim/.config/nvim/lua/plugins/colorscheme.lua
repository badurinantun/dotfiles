return {
  {
    'mcchrish/zenbones.nvim',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'zenwritten'
    end,
    dependencies = {
      'rktjmp/lush.nvim',
    },
  },
}

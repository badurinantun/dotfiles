return {
  {
    'mcchrish/zenbones.nvim',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'zenburned'
    end,
    dependencies = {
      'rktjmp/lush.nvim',
    },
  },
}

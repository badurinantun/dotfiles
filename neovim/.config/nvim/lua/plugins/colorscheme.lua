return {
  {
    'mcchrish/zenbones.nvim',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'rosebones'
      vim.g.rosebones = { darkness = 'warm', transparent_background = true }
      vim.api.nvim_set_option('background', 'dark')
    end,
    dependencies = {
      'rktjmp/lush.nvim',
    },
  },
}

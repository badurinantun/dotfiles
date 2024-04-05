return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = { 'bash', 'c', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'vim', 'vimdoc' },
      autotag = true,
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = { enable = true },
    },
    dependencies = {
      'windwp/nvim-ts-autotag',
    },
    config = function(_, opts)
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup(opts)

      require('nvim-ts-autotag').setup()
    end,
  },
  'nvim-treesitter/nvim-treesitter-context',
}

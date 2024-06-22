return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = { 'graphql', 'bash', 'c', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'vim', 'vimdoc' },
      ignore_install = { 'org' },
      autotag = true,
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = { enable = false },
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

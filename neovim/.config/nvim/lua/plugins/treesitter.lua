return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = {  'bash', 'c', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'vim', 'vimdoc' },
      autotag = true,
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = { enable = false },
    },
  },
}

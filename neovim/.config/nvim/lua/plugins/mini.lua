return {
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup { n_lines = 500 }
      require('mini.basics').setup {
        mappings = {
          move_with_alt = true,
        },
      }
      require('mini.bracketed').setup()
      require('mini.comment').setup()
      require('mini.jump').setup()
      require('mini.surround').setup()
      require('mini.pairs').setup()
      require('mini.move').setup()
    end,
  },
}

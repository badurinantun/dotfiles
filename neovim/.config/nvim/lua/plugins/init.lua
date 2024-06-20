return {
  -- detect tabstop and shiftwidth
  'tpope/vim-sleuth',
  {
    'Aasim-A/scrollEOF.nvim',
    event = { 'CursorMoved', 'WinScrolled' },
    opts = {},
  },
  {
    'mbbill/undotree',
    init = function()
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Undotree' })
    end,
  },
  { 'kevinhwang91/nvim-bqf' },
}

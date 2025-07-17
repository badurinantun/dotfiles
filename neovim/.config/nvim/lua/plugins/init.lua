return {
  -- detect tabstop and shiftwidth
  'tpope/vim-sleuth',
  {
    'Aasim-A/scrollEOF.nvim',
    event = { 'CursorMoved', 'WinScrolled' },
    opts = {},
  },
  { 'kevinhwang91/nvim-bqf' },
}

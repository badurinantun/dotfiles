return {
  {
    'stevearc/oil.nvim',
    opts = {
      default_file_explorer = false,
      columns = {},
      keymaps = {
        ['q'] = 'actions.close',
      },
      view_options = {
        show_hidden = true,
      },
    },
    init = function()
      vim.keymap.set('n', '<leader>e', '<CMD>Oil --float<CR>', { desc = 'File explorer' })
    end,
  },
}

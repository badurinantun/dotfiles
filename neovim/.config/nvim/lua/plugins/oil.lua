local permission_hlgroups = {
  ['-'] = 'NonText',
  ['r'] = 'DiagnosticSignWarn',
  ['w'] = 'DiagnosticSignError',
  ['x'] = 'DiagnosticSignOk',
}

local show_colums = false

local columns = {}

if show_colums then
  columns = {
    {
      'permissions',
      highlight = function(permission_str)
        local hls = {}
        for i = 1, #permission_str do
          local char = permission_str:sub(i, i)
          table.insert(hls, { permission_hlgroups[char], i - 1, i })
        end
        return hls
      end,
    },
    { 'size', highlight = 'Special' },
    { 'mtime', highlight = 'Number' },
    'icon',
  }
end

return {
  {
    'stevearc/oil.nvim',
    opts = {
      default_file_explorer = false,
      columns = columns,
      keymaps = {
        ['q'] = 'actions.close',
      },
      view_options = {
        show_hidden = true,
      },
      win_options = {
        number = false,
        relativenumber = false,
        signcolumn = 'no',
        foldcolumn = '0',
        statuscolumn = '',
      },
    },
    init = function()
      vim.keymap.set('n', '<leader>e', '<CMD>Oil<CR>', { desc = 'File explorer' })
    end,
  },
}

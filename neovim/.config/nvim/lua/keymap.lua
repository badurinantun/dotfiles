-- General
vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = 'Close'})

-- Clear search highlights
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Explorer
vim.keymap.set('n', '<leader>e', ':Ex<CR>', { desc = 'Explorer' })

-- Set up keybindings for LSP
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local opts = { buffer = event.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'grn', vim.lsp.buf.rename, opts)
  end,
})



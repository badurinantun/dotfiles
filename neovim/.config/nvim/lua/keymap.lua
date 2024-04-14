-- Clear search highlights
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Lazy.nvim
vim.keymap.set('n', '<leader>l', '<cmd>Lazy<CR>', { desc = 'Lazy' })

-- Movements
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')
vim.keymap.set('n', 'j', 'jzz')
vim.keymap.set('n', 'k', 'kzz')

-- Macros
vim.keymap.set('n', 'Q', '@qj')
vim.keymap.set('x', 'Q', ':norm @q<CR>')

local language_servers = {
  tailwindcss = {},
  eslint = {},
  tsserver = {},
  gopls = {},
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
      },
    },
  },
}

return {
  {
    'zbirenbaum/copilot.lua',
    config = function()
      require('copilot').setup {
        suggestion = { enabled = false },
        panel = { enabled = false },
      }
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        build = 'make install_jsregexp',
      },
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      {
        'zbirenbaum/copilot-cmp',
        config = function()
          require('copilot_cmp').setup()
        end,
      },
    },
    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },
        mapping = cmp.mapping.preset.insert {
          -- Select the [n]ext item
          ['<C-n>'] = cmp.mapping.select_next_item(),
          -- Select the [p]revious item
          ['<C-p>'] = cmp.mapping.select_prev_item(),

          -- Scroll the documentation window
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-u>'] = cmp.mapping.scroll_docs(4),

          ['<C-y>'] = cmp.mapping.confirm { select = true },
        },
        sources = {
          { name = 'copilot' },
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        },
      }
    end,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),

        callback = function(event)
          vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, { desc = 'Go to defintion' })
          vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = 'Go to references' })
          vim.keymap.set('n', '<leader>s', require('telescope.builtin').lsp_document_symbols, { desc = 'Documents symbols' })
          vim.keymap.set('n', '<leader>S', require('telescope.builtin').lsp_workspace_symbols, { desc = 'Workspace symbols' })
          vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, { desc = 'Rename' })
          vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, { desc = 'Code action' })
          vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, { desc = 'Hover' })

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      require('mason').setup()

      local ensure_installed = vim.tbl_keys(language_servers or {})

      vim.list_extend(ensure_installed, {
        'stylua',
        'typescript-language-server',
        'tailwindcss-language-server',
        'eslint-lsp',
      })

      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = language_servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    opts = {
      notify_on_error = false,
      format_on_save = function()
        return {
          timeout_ms = 500,
          lsp_fallback = true,
        }
      end,
      formatters = {
        prettier = {
          prepend_args = { '--config', '.prettierrc' },
        },
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { 'prettier' },
        typescriptreact = { 'prettier' },
        typescript = { 'prettier' },
      },
    },
  },
}

local M = {}

M.clean_plugins = function()
  vim.g.editorconfig = false
  vim.g.loaded_man = false
  vim.g.loaded_remote_plugins = 1
  vim.g.loaded_shada_plugin = 1
  vim.g.loaded_spellfile_plugin = 1
  vim.g.loaded_gzip = 1
  vim.g.loaded_tar = 1
  vim.g.loaded_tarPlugin = 1
  vim.g.loaded_zip = 1
  vim.g.loaded_zipPlugin = 1
  vim.g.loaded_2html_plugin = 1

  vim.g.loaded_python3_provider = 0
  vim.g.loaded_ruby_provider = 0
  vim.g.loaded_perl_provider = 0
  vim.g.loaded_node_provider = 0
end

return M

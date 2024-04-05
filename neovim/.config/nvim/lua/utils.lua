local U = {}

U.show_telescope_on_startup = function()
  -- show telescope on startup if args was '.'
  return vim.fn.argv(0) == '.'
end

return U

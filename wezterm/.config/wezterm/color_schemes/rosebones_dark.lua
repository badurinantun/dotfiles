local M = {}

local colors = {
  foreground = '#e0def4',
  background = '#232136',
  cursor_bg = '#e0def4',
  cursor_border = '#e0def4',
  cursor_fg = '#232136',
  selection_bg = '#232136',
  selection_fg = '#e0def4',
  ansi = { '#393552', '#eb6f92', '#9ccfd8', '#f6c177', '#3e8fb0', '#c4a7e7', '#ea9a97', '#e0def4' },
  brights = { '#6e6a86', '#eb6f92', '#9ccfd8', '#f6c177', '#3e8fb0', '#c4a7e7', '#ea9a97', '#e0def4' },
}

local wezterm = require 'wezterm'
local scheme = wezterm.get_builtin_color_schemes()['rose-pine-moon']

scheme.cursor_bg = colors.cursor_bg
scheme.selection_fg = colors.foreground
scheme.selection_bg = colors.selection_bg

scheme.tab_bar = {
  background = colors.background,
  active_tab = {
    bg_color = colors.background,
    fg_color = colors.foreground,
    intensity = 'Bold',
  },
  inactive_tab = {
    bg_color = colors.background,
    fg_color = colors.brights[1],
  },
  inactive_tab_hover = {
    bg_color = colors.background,
    fg_color = colors.foreground,
    italic = true,
  },
}

M.scheme = scheme
M.colors = colors

return M

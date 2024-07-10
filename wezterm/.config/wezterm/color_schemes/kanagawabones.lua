local M = {}

local colors = {
  foreground = '#ddd8bb',
  background = '#1f1f28',
  cursor_bg = '#e6e0c2',
  cursor_border = '#e6e0c2',
  cursor_fg = '#1f1f28',
  selection_bg = '#49473e',
  selection_fg = '#ddd8bb',

  ansi = { '#1f1f28', '#e46a78', '#98bc6d', '#e5c283', '#7eb3c9', '#957fb8', '#7eb3c9', '#ddd8bb' },
  brights = { '#3c3c51', '#ec818c', '#9ec967', '#f1c982', '#7bc2df', '#a98fd2', '#7bc2df', '#a8a48d' },
}

local wezterm = require 'wezterm'
local scheme = wezterm.get_builtin_color_schemes()['kanagawabones']

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

local M = {}

local colors = {
  foreground = '#575279',
  background = '#faf4ed',
  cursor_bg = '#575279',
  cursor_border = '#575279',
  cursor_fg = '#faf4ed',
  selection_bg = '#faf4ed',
  selection_fg = '#575279',
  ansi = { '#f2e9e1', '#b4637a', '#56949f', '#ea9d34', '#286983', '#907aa9', '#d7827e', '#575279' },
  brights = { '#9893a5', '#b4637a', '#56949f', '#ea9d34', '#286983', '#907aa9', '#d7827e', '#575279' },
}

local wezterm = require 'wezterm'
local scheme = wezterm.get_builtin_color_schemes()['rose-pine-dawn']

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

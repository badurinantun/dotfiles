local colors = {
  background = '#e5ede6',
  cursor_bg = '#202e18',
  foreground = '#202e18',
  selection_bg = '#ade48c',
  ansi = { '#e5ede6', '#a8334c', '#567a30', '#944927', '#286486', '#88507d', '#3b8992', '#202e18' },
  brights = { '#b3c6b6', '#94253e', '#3f5a22', '#803d1c', '#1d5573', '#7b3b70', '#2b747c', '#415934' },
}

local wezterm = require 'wezterm'
local scheme = wezterm.get_builtin_color_schemes()['neobones_light']

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

return scheme

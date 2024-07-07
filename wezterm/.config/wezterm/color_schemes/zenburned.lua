local M = {}

local colors = {
  foreground = '#F0E4CF',
  background = '#404040',
  cursor_fg = '#404040',
  cursor_bg = '#F3EADB',
  cursor_border = '#404040',
  selection_fg = '#F0E4CF',
  selection_bg = '#746956',
  ansi = { '#404040', '#E3716E', '#819B69', '#B77E64', '#6099C0', '#B279A7', '#66A5AD', '#F0E4CF' },
  brights = { '#625A5B', '#EC8685', '#8BAE68', '#D68C67', '#61ABDA', '#CF86C1', '#65B8C1', '#C0AB86' },
}

local wezterm = require 'wezterm'
local scheme = wezterm.get_builtin_color_schemes()['zenburned']

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

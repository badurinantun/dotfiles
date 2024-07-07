local M = {}

local colors = {
  foreground = '#bbbbbb',
  background = '#191919',
  cursor_bg = '#c9c9c9',
  cursor_border = '#c9c9c9',
  cursor_fg = '#191919',
  selection_bg = '#404040',
  selection_fg = '#bbbbbb',
  ansi = { '#191919', '#de6e7c', '#819b69', '#b77e64', '#6099c0', '#b279a7', '#66a5ad', '#bbbbbb' },
  brights = { '#3d3839', '#e8838f', '#8bae68', '#d68c67', '#61abda', '#cf86c1', '#65b8c1', '#8e8e8e' },
}

local wezterm = require 'wezterm'
local scheme = wezterm.get_builtin_color_schemes()['zenwritten_dark']

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

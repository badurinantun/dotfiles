local M = {}

local colors = {
  foreground = "#c6d5cf",
  background = "#0f191f",
  cursor_bg = "#ceddd7",
  cursor_border = "#ceddd7",
  cursor_fg = "#0f191f",
  selection_bg = "#3a3e3d",
  selection_fg = "#c6d5cf",

  ansi = {"#0f191f","#de6e7c","#90ff6b","#b77e64","#8190d4","#b279a7","#66a5ad","#c6d5cf"},
  brights = {"#263945","#e8838f","#a0ff85","#d68c67","#92a0e2","#cf86c1","#65b8c1","#98a39e"},
}

local wezterm = require 'wezterm'
local scheme = wezterm.get_builtin_color_schemes()['neobones_dark']

scheme.cursor_bg = colors.cursor_bg
scheme.selection_fg = colors.selection_fg
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

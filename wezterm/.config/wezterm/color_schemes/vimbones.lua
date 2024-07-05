local M = {}

local colors = {
  foreground = "#353535",
  background = "#f0f0ca",
  cursor_bg = "#353535",
  cursor_border = "#353535",
  cursor_fg = "#f0f0ca",
  selection_bg = "#d7d7d7",
  selection_fg = "#353535",

  -- white, red, green, orange, blue, purple, cyan, black
  ansi = { "#f0f0ca", "#a8334c", "#4f6c31", "#944927", "#286486", "#88507d", "#3b8992", "#353535" },
  brights = { "#c6c6a3", "#94253e", "#3f5a22", "#803d1c", "#1d5573", "#7b3b70", "#2b747c", "#5c5c5c" },
}

local wezterm = require 'wezterm'
local scheme = wezterm.get_builtin_color_schemes()['vimbones']

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

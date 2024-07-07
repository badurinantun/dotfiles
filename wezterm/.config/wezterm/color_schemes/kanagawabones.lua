local M = {}

local colors = {
  foreground    = "#DDD8BB",
  background    = "#1F1F28",
  cursor_fg     = "#1F1F28",
  cursor_bg     = "#E6E0C2",
  cursor_border = "#1F1F28",
  selection_fg  = "#DDD8BB",
  selection_bg  = "#49473E",
  ansi = {"#1F1F28", "#E46A78", "#98BC6D", "#E5C283", "#7EB3C9", "#957FB8", "#7EB3C9", "#DDD8BB"},
  brights = {"#3C3C51", "#EC818C", "#9EC967", "#F1C982", "#7BC2DF", "#A98FD2", "#7BC2DF", "#A8A48D"},
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

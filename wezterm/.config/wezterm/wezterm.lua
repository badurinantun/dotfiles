local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- general
config.font_size = 11.0
config.enable_wayland = true

-- tabs
config.tab_max_width = 64
config.use_fancy_tab_bar = false
config.switch_to_last_active_tab_when_closing_tab = true
config.show_new_tab_button_in_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = false

-- window
config.window_decorations = 'NONE'

-- colors
config.color_scheme = 'kanagawabones'

config.color_schemes = {
  ['vimbones'] = require('color_schemes.vimbones').scheme,
  ['kanagawabones'] = require('color_schemes.kanagawabones').scheme,
  ['zenburned'] = require('color_schemes.zenburned').scheme,
  ['rosebones_dark'] = require('color_schemes.rosebones_dark').scheme,
  ['rosebones_light'] = require('color_schemes.rosebones_light').scheme,
  ['zenwritten_dark'] = require('color_schemes.zenwritten_dark').scheme,
  ['zenwritten_light'] = require('color_schemes.zenwritten_light').scheme,
  ['neobones_dark'] = require('color_schemes.neobones_dark').scheme,
  ['neobones_light'] = require('color_schemes.neobones_light').scheme,
}

-- keys
config.disable_default_key_bindings = false

return config

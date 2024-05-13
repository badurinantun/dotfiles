local wezterm = require 'wezterm'
local keys = require 'keys'
local rosebones_light = require 'color_schemes.rosebones_light'
local rosebones_dark = require 'color_schemes.rosebones_dark'

local config = wezterm.config_builder()

-- general
config.font_size = 12.0
config.enable_wayland = false

-- tabs
config.tab_max_width = 64
config.use_fancy_tab_bar = false
config.switch_to_last_active_tab_when_closing_tab = true
config.show_new_tab_button_in_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = false

-- window
config.window_background_opacity = 0.95
config.window_decorations = 'RESIZE'
config.macos_window_background_blur = 20

-- colors
config.color_scheme = 'rosebones_dark'

config.color_schemes = {
  ['rosebones_light'] = rosebones_light.scheme,
  ['rosebones_dark'] = rosebones_dark.scheme,
}

-- keys
config.disable_default_key_bindings = true
config.keys = keys

return config

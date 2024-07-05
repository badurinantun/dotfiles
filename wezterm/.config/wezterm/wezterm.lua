local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- general
config.font_size = 12.0
config.enable_wayland = true

-- tabs
config.tab_max_width = 64
config.use_fancy_tab_bar = false
config.switch_to_last_active_tab_when_closing_tab = true
config.show_new_tab_button_in_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = false

-- window
config.window_decorations = 'RESIZE'

-- colors
config.color_scheme = 'vimbones'

config.color_schemes = {
  ['vimbones'] = require('color_schemes.vimbones').scheme,
}

-- keys
config.disable_default_key_bindings = false

return config

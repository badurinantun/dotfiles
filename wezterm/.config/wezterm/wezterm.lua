local wezterm = require 'wezterm'
local keys = require 'keys'

wezterm.on('update-right-status', function(window)
  local leader = ''
  if window:leader_is_active() then
    leader = '<LEADER>'
  end
  window:set_right_status(leader)
end)

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
config.window_decorations = 'RESIZE'

-- colors
config.color_scheme = 'zenburned'

config.color_schemes = {
  ['zenburned'] = require('color_schemes.zenburned').scheme,
}

-- keys
config.disable_default_key_bindings = true
config.leader = { key = ' ', mods = 'CTRL', timeout_milliseconds = 1500 }
config.keys = keys

return config

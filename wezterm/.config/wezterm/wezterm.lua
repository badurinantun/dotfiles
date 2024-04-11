local wezterm = require 'wezterm'
local keys = require 'keys'
local rosebones_light = require 'color_schemes.rosebones_light'
local rosebones_dark = require 'color_schemes.rosebones_dark'

local config = wezterm.config_builder()

-- general
config.font_size = 12.0

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
local function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'rosebones_dark'
  else
    return 'rosebones_light'
  end
end

wezterm.on('window-config-reloaded', function(window)
  local overrides = window:get_config_overrides() or {}
  local appearance = window:get_appearance()
  local scheme = scheme_for_appearance(appearance)
  if overrides.color_scheme ~= scheme then
    overrides.color_scheme = scheme
    window:set_config_overrides(overrides)
  end
end)

config.color_schemes = {
  ['rosebones_light'] = rosebones_light,
  ['rosebones_dark'] = rosebones_dark,
}

-- keys
config.keys = keys

return config

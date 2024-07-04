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
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false

-- window
config.window_decorations = 'NONE'

-- colors
config.color_scheme = 'zenwritten_dark'

config.color_schemes = {
  ['zenwritten_light'] = require('color_schemes.zenwritten_light').scheme,
  ['zenwritten_dark'] = require('color_schemes.zenwritten_dark').scheme,
}

local function scheme_for_appearance(appearance)
  if appearance:find 'Light' then
    return 'zenwritten_light'
  else
    return 'zenwritten_dark'
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

-- keys
config.disable_default_key_bindings = false

return config

local wezterm = require 'wezterm'
local action = wezterm.action

return {
  {
    key = '-',
    mods = 'SHIFT|SUPER',
    action = action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = '=',
    mods = 'SHIFT|SUPER',
    action = action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'w',
    mods = 'SHIFT|SUPER',
    action = action.CloseCurrentPane { confirm = true },
  },
  {
    key = 'p',
    mods = 'SHIFT|SUPER',
    action = action.PaneSelect {},
  },
  {
    key = 'h',
    mods = 'SHIFT|SUPER',
    action = action.ActivatePaneDirection 'Left',
  },
  {
    key = 'l',
    mods = 'SHIFT|SUPER',
    action = action.ActivatePaneDirection 'Right',
  },
  {
    key = 'k',
    mods = 'SHIFT|SUPER',
    action = action.ActivatePaneDirection 'Up',
  },
  {
    key = 'j',
    mods = 'SHIFT|SUPER',
    action = action.ActivatePaneDirection 'Down',
  },
}

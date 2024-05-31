local wezterm = require 'wezterm'
local action = wezterm.action

return {
  {
    key = 'q',
    mods = 'LEADER',
    action = action.QuitApplication,
  },
  -- clipboard
  {
    key = 'C',
    mods = 'SHIFT|CTRL',
    action = action.CopyTo 'Clipboard',
  },
  {
    key = 'V',
    mods = 'SHIFT|CTRL',
    action = action.PasteFrom 'Clipboard',
  },
  --tabs
  {
    key = 't',
    mods = 'LEADER',
    action = action.SpawnTab 'CurrentPaneDomain',
  },
  {
    key = 'w',
    mods = 'LEADER',
    action = action.CloseCurrentTab { confirm = true },
  },
  {
    key = 'p',
    mods = 'LEADER',
    action = action.ActivateTabRelative(-1),
  },
  {
    key = 'n',
    mods = 'LEADER',
    action = action.ActivateTabRelative(1),
  },
  -- copy mode
  {
    key = 'y',
    mods = 'LEADER',
    action = action.ActivateCopyMode,
  },
  -- quick select
  {
    key = 's',
    mods = 'LEADER',
    action = action.QuickSelect,
  },
  -- panes
  {
    key = '-',
    mods = 'LEADER',
    action = action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = '=',
    mods = 'LEADER',
    action = action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'x',
    mods = 'LEADER',
    action = action.CloseCurrentPane { confirm = true },
  },
  {
    key = 'h',
    mods = 'LEADER',
    action = action.ActivatePaneDirection 'Left',
  },
  {
    key = 'l',
    mods = 'LEADER',
    action = action.ActivatePaneDirection 'Right',
  },
  {
    key = 'k',
    mods = 'LEADER',
    action = action.ActivatePaneDirection 'Up',
  },
  {
    key = 'j',
    mods = 'LEADER',
    action = action.ActivatePaneDirection 'Down',
  },
  {
    key = 'z',
    mods = 'LEADER',
    action = action.TogglePaneZoomState,
  },
}

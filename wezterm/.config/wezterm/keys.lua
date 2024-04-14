local wezterm = require 'wezterm'
local action = wezterm.action

return {
  {
    key = 'q',
    mods = 'SUPER',
    action = action.QuitApplication,
  },
  -- clipboard
  {
    key = 'c',
    mods = 'SUPER',
    action = action.CopyTo 'Clipboard',
  },
  {
    key = 'c',
    mods = 'SUPER|CTRL',
    action = action.CopyTo 'Clipboard',
  },
  {
    key = 'v',
    mods = 'SUPER',
    action = action.PasteFrom 'Clipboard',
  },
  {
    key = 'v',
    mods = 'SUPER|CTRL',
    action = action.PasteFrom 'Clipboard',
  },
  -- font size
  {
    key = '-',
    mods = 'SUPER',
    action = action.DecreaseFontSize,
  },
  {
    key = '=',
    mods = 'SUPER',
    action = action.IncreaseFontSize,
  },
  {
    key = '0',
    mods = 'SUPER',
    action = action.ResetFontSize,
  },
  --tabs
  {
    key = 't',
    mods = 'SUPER',
    action = action.SpawnTab 'CurrentPaneDomain',
  },
  {
    key = 'w',
    mods = 'SUPER',
    action = action.CloseCurrentTab { confirm = true },
  },
  {
    key = '[',
    mods = 'SUPER|SHIFT',
    action = action.ActivateTabRelative(-1),
  },
  {
    key = ']',
    mods = 'SUPER|SHIFT',
    action = action.ActivateTabRelative(1),
  },
  -- command palette
  {
    key = 'P',
    mods = 'CTRL|SHIFT',
    action = action.ActivateCommandPalette,
  },
  -- copy mode
  {
    key = 'X',
    mods = 'CTRL|SHIFT',
    action = action.ActivateCopyMode,
  },
  -- panes
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
  {
    key = 'Z',
    mods = 'CTRL|SHIFT',
    action = action.TogglePaneZoomState,
  },
}

local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'OLEDppuccin'
-- config.color_scheme = 'Dracula'

config.keys = {
  {
    key = 'O',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SpawnCommandInNewTab {
      args = { '/bin/zsh', '-l', '-c', 'nvim /Users/ralin/Documents/todo' },
    },
  },
  {
    key = 'k',
    mods = 'CMD',
    action = wezterm.action.ClearScrollback 'ScrollbackAndViewport',
  },
  {
    key = '\\',
    mods = 'CTRL',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '-',
    mods = 'CTRL',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'h',
    mods = 'CTRL',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'l',
    mods = 'CTRL',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key = 'k',
    mods = 'CTRL',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'j',
    mods = 'CTRL',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  {
    key = 'z',
    mods = 'CMD',
    action = wezterm.action.TogglePaneZoomState,
  },
}

return config

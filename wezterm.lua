local wezterm = require 'wezterm'

local config = wezterm.config_builder()

if wezterm.gui.get_appearance():find 'Dark' then
  config.color_scheme = 'rose-pine'
  config.colors = { selection_bg = '#403d52' }
else
  config.color_scheme = 'rose-pine-dawn'
  config.colors = { selection_bg = '#dfdad9' }
end

local function herdr_or(key, action)
  return {
    key = key,
    mods = 'CTRL',
    action = wezterm.action_callback(function(window, pane)
      local process = pane:get_foreground_process_name()
      if process and process:find '/herdr$' then
        window:perform_action(wezterm.action.SendKey { key = key, mods = 'CTRL' }, pane)
      else
        window:perform_action(action, pane)
      end
    end),
  }
end

config.keys = {
  herdr_or('s', wezterm.action.ActivateKeyTable { name = 'split', timeout_milliseconds = 1000 }),
  herdr_or('h', wezterm.action.ActivatePaneDirection 'Left'),
  herdr_or('l', wezterm.action.ActivatePaneDirection 'Right'),
  herdr_or('k', wezterm.action.ActivatePaneDirection 'Up'),
  herdr_or('j', wezterm.action.ActivatePaneDirection 'Down'),
  {
    key = 'O',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SpawnCommandInNewTab {
      args = { '/bin/zsh', '-l', '-c', 'nvim ~/Documents/TODO.md' },
    },
  },
  {
    key = 'k',
    mods = 'CMD',
    action = wezterm.action.ClearScrollback 'ScrollbackAndViewport',
  },
  {
    key = 'z',
    mods = 'CMD',
    action = wezterm.action.TogglePaneZoomState,
  },
}

config.key_tables = {
  split = {
    { key = 'v', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = 'x', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
  },
}

return config

local function get_next_pane_id()
  local raw = vim.fn.system 'wezterm cli list --format json'
  local panes = vim.fn.json_decode(raw)
  local current = tonumber(os.getenv 'WEZTERM_PANE')

  local current_pane
  for _, p in ipairs(panes) do
    if p.pane_id == current then
      current_pane = p
      break
    end
  end

  if not current_pane then
    return nil
  end

  local same_tab = {}
  for _, p in ipairs(panes) do
    if p.window_id == current_pane.window_id and p.tab_id == current_pane.tab_id then
      table.insert(same_tab, p)
    end
  end

  table.sort(same_tab, function(a, b)
    return a.pane_id < b.pane_id
  end)

  for _, p in ipairs(same_tab) do
    if p.pane_id > current then
      return p.pane_id
    end
  end

  return same_tab[1] and same_tab[1].pane_id or nil
end

local function build_command(config, run)
  local path = vim.fn.expand '%:p'
  local line = vim.api.nvim_win_get_cursor(0)[1]

  local cmd
  if run == 'last' then
    cmd = vim.g[config.last_cmd_key] or config.base_cmd
  elseif run == 'nearest' then
    cmd = string.format('%s %s:%d', config.base_cmd, path, line)
  elseif run == 'file' then
    cmd = string.format('%s %s', config.base_cmd, path)
  elseif run == 'all' then
    cmd = config.base_cmd
  else
    error('Invalid run type: ' .. tostring(run))
  end

  return cmd .. config.suffix
end

local function run_spec(spec, run)
  local configs = {
    playwright = {
      base_cmd = 'yarn playwright test',
      suffix = ' --project=chromium',
      last_cmd_key = 'playwright_last_command',
    },
    rspec = {
      base_cmd = 'bundle exec rspec',
      suffix = '',
      last_cmd_key = 'rspec_last_command',
    },
  }
  local config = configs[spec]

  if not config then
    vim.api.nvim_err_writeln('Unknown test type: ' .. tostring(spec))
    return
  end

  local cmd = build_command(config, run)
  vim.g[config.last_cmd_key] = cmd

  local target = get_next_pane_id()
  if not target then
    vim.api.nvim_err_writeln 'No target pane found.'
    return
  end

  vim.fn.jobstart({
    'wezterm',
    'cli',
    'send-text',
    '--no-paste',
    '--pane-id',
    tostring(target),
    cmd .. '\n',
  }, { detach = true })
end

for _, keymap_config in ipairs {
  { prefix = 'p', spec = 'playwright' },
  { prefix = 's', spec = 'rspec' },
} do
  for _, run_config in ipairs {
    { suffix = 'a', run = 'all' },
    { suffix = 'f', run = 'file' },
    { suffix = 'n', run = 'nearest' },
    { suffix = 'l', run = 'last' },
  } do
    vim.keymap.set('n', '<leader>' .. keymap_config.prefix .. run_config.suffix, function()
      run_spec(keymap_config.spec, run_config.run)
    end, { noremap = true, silent = true })
  end
end

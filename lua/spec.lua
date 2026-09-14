local function next_surface_id()
  local raw = vim.fn.system 'cmux list-panes --json --id-format both'
  local panes = vim.fn.json_decode(raw).panes

  for i, pane in ipairs(panes) do
    if vim.tbl_contains(pane.surface_ids, vim.env.CMUX_SURFACE_ID) then
      return #panes > 1 and panes[i % #panes + 1].selected_surface_id or nil
    end
  end

  return nil
end

local function build_command(config, run)
  local path = vim.fn.expand '%:p'
  local line = vim.api.nvim_win_get_cursor(0)[1]

  local cmd
  if run == 'last' then
    return vim.g[config.last_cmd_key] or (config.base_cmd .. config.suffix)
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

  local target = next_surface_id()
  if not target then
    vim.api.nvim_err_writeln 'No target pane found.'
    return
  end

  vim.fn.jobstart({ 'cmux', 'send', '--surface', target, cmd .. '\n' }, { detach = true })
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

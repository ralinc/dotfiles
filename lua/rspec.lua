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

local function rspec(run)
  local path = vim.fn.expand '%:p'
  local line = vim.api.nvim_win_get_cursor(0)[1]

  local cmd
  if run == 'last' then
    cmd = vim.g.rspec_last_command or 'bundle exec rspec'
  elseif run == 'nearest' then
    cmd = string.format('bundle exec rspec %s:%d', path, line)
  elseif run == 'file' then
    cmd = string.format('bundle exec rspec %s', path)
  elseif run == 'all' then
    cmd = 'bundle exec rspec'
  else
    vim.api.nvim_err_writeln('Invalid argument: ' .. tostring(run))
    return
  end

  vim.g.rspec_last_command = cmd

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

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>sa', function()
  rspec 'all'
end, opts)
vim.keymap.set('n', '<leader>sf', function()
  rspec 'file'
end, opts)
vim.keymap.set('n', '<leader>sn', function()
  rspec 'nearest'
end, opts)
vim.keymap.set('n', '<leader>sl', function()
  rspec 'last'
end, opts)

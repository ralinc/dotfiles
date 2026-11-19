local function next_surface_id()
  if not vim.env.CMUX_SURFACE_ID then
    return nil
  end

  local raw = vim.fn.system 'cmux list-panes --json --id-format both'
  local panes = vim.fn.json_decode(raw).panes

  for i, pane in ipairs(panes) do
    if vim.tbl_contains(pane.surface_ids, vim.env.CMUX_SURFACE_ID) then
      return #panes > 1 and panes[i % #panes + 1].selected_surface_id or nil
    end
  end

  return nil
end

local function send(runner, cmd)
  runner.last = cmd
  local text = cmd .. runner.suffix .. '\n'

  if vim.env.WEZTERM_PANE then
    local pane = vim.trim(vim.fn.system 'wezterm cli get-pane-direction Next')
    if pane == vim.env.WEZTERM_PANE then
      pane = vim.trim(vim.fn.system 'wezterm cli split-pane --right')
      vim.fn.system 'wezterm cli activate-pane'
    end

    vim.fn.jobstart({ 'wezterm', 'cli', 'send-text', '--pane-id', pane, '--no-paste', text }, { detach = true })
    return
  end

  local target = next_surface_id()
  if not target then
    vim.notify('No target pane found.', vim.log.levels.ERROR)
    return
  end

  vim.fn.jobstart({ 'cmux', 'send', '--surface', target, text }, { detach = true })
end

for prefix, runner in pairs {
  p = { cmd = 'npx playwright test', suffix = ' --project=chromium' },
  s = { cmd = 'bundle exec rspec', suffix = '' },
} do
  vim.keymap.set('n', '<leader>' .. prefix .. 'a', function()
    send(runner, runner.cmd)
  end)
  vim.keymap.set('n', '<leader>' .. prefix .. 'f', function()
    send(runner, runner.cmd .. ' ' .. vim.fn.expand '%:p')
  end)
  vim.keymap.set('n', '<leader>' .. prefix .. 'n', function()
    send(runner, runner.cmd .. ' ' .. vim.fn.expand '%:p' .. ':' .. vim.fn.line '.')
  end)
  vim.keymap.set('n', '<leader>' .. prefix .. 'l', function()
    send(runner, runner.last or runner.cmd)
  end)
end

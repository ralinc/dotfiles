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

local function send(runner, cmd)
  runner.last = cmd

  local target = next_surface_id()
  if not target then
    vim.notify('No target pane found.', vim.log.levels.ERROR)
    return
  end

  vim.fn.jobstart({ 'cmux', 'send', '--surface', target, cmd .. runner.suffix .. '\n' }, { detach = true })
end

for prefix, runner in pairs {
  p = { cmd = 'yarn playwright test', suffix = ' --project=chromium' },
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

local function send(runner, cmd)
  runner.last = cmd
  local text = cmd .. runner.suffix

  if vim.env.WEZTERM_PANE then
    local pane = vim.trim(vim.fn.system 'wezterm cli get-pane-direction Next')
    if pane == vim.env.WEZTERM_PANE then
      pane = vim.trim(vim.fn.system 'wezterm cli split-pane --right')
      vim.fn.system 'wezterm cli activate-pane'
    end

    vim.fn.jobstart({ 'wezterm', 'cli', 'send-text', '--pane-id', pane, '--no-paste', text .. '\n' }, { detach = true })
  elseif vim.env.GHOSTTY_RESOURCES_DIR then
    vim.fn.jobstart({
      'osascript',
      '-e',
      [[
        on run argv
          tell application "Ghostty"
            set nvim to focused terminal of selected tab of front window
            set panes to terminals of selected tab of front window
            if (count of panes) is 1 then
              set target to split nvim direction right
              focus nvim
            else
              repeat with i from 1 to count of panes
                if id of item i of panes is id of nvim then
                  set target to item (i mod (count of panes) + 1) of panes
                end if
              end repeat
            end if
            input text (item 1 of argv) to target
            send key "enter" to target
          end tell
        end run
      ]],
      text,
    }, { detach = true })
  else
    vim.notify('No WezTerm or Ghostty pane to send to.', vim.log.levels.ERROR)
  end
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

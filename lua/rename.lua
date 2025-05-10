local function rename_file()
  local old_name = vim.fn.expand '%'
  local new_name = vim.fn.input('New name: ', vim.fn.expand '%', 'file')

  if new_name ~= '' and new_name ~= old_name then
    vim.cmd('saveas ' .. new_name)
    vim.fn.system('rm ' .. vim.fn.shellescape(old_name))
    vim.cmd 'redraw!'
  end
end

vim.keymap.set('n', '<leader>rf', rename_file, { noremap = true, silent = true })

local function rename_file()
  local old_name = vim.fn.expand '%'
  local new_name = vim.fn.input('New name: ', vim.fn.expand '%', 'file')

  if new_name ~= '' and new_name ~= old_name then
    vim.fn.rename(old_name, new_name)
    vim.cmd('edit ' .. vim.fn.fnameescape(new_name))
    vim.cmd('bdelete #')
    vim.cmd 'redraw!'
  end
end

vim.keymap.set('n', '<leader>rf', rename_file, { noremap = true, silent = true })

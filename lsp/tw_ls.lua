return {
  cmd = { 'tailwindcss-language-server', '--stdio' },
  filetypes = { 'html', 'css', 'typescript', 'typescriptreact' },
  root_dir = function(bufnr, on_dir)
    local root = vim.fs.root(bufnr, function(name, path)
      return name == 'package.json' and vim.fn.match(vim.fn.readfile(vim.fs.joinpath(path, name)), '"tailwindcss"') >= 0
    end)
    if root then
      on_dir(root)
    end
  end,
}

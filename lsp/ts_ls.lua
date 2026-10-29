return {
  cmd = function(dispatchers, config)
    local root = config.root_dir or vim.fn.getcwd()
    local tsc = root .. '/node_modules/.bin/tsc'
    local tsserver = root .. '/node_modules/typescript/lib/tsserver.js'
    local native = vim.fn.executable(tsc) == 1 and not vim.uv.fs_stat(tsserver)
    local cmd = native and { tsc, '--lsp', '--stdio' } or { 'typescript-language-server', '--stdio' }
    return vim.lsp.rpc.start(cmd, dispatchers, { cwd = root })
  end,
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  root_markers = { 'tsconfig.json', 'package.json' },
}

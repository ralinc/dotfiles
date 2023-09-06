local util = require 'formatter.util'

local format_yarn_pnp = function()
  return {
    exe = 'yarn',
    args = {
      'pnpify',
      'prettier',
      '--stdin-filepath',
      util.escape_path(util.get_current_buffer_file_path()),
    },
    stdin = true,
  }
end

require('formatter').setup {
  filetype = {
    go = {
      require('formatter.filetypes.go').gofmt,
      require('formatter.filetypes.go').goimports,
    },
    javascript = {
      require('formatter.filetypes.javascript').prettier,
    },
    json = {
      require('formatter.filetypes.json').prettier,
    },
    lua = {
      require('formatter.filetypes.lua').stylua,
    },
    python = {
      require('formatter.filetypes.python').black,
      require('formatter.filetypes.python').isort,
    },
    typescript = { format_yarn_pnp },
    typescriptreact = { format_yarn_pnp },
  },
}

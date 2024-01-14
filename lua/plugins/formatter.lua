local util = require 'formatter.util'

local format_y = function()
  return {
    exe = 'yarn',
    args = {
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
    css = {
      format_y,
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
    markdown = {
      require('formatter.filetypes.markdown').prettier,
    },
    python = {
      require('formatter.filetypes.python').black,
      require('formatter.filetypes.python').isort,
    },
    typescript = {
      format_y,
    },
    typescriptreact = {
      format_y,
    },
  },
}

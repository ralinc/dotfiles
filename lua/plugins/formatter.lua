local util = require "formatter.util"

local format_yarn_pnp = function()
  return {
    exe   = "yarn",
    args  = {
      "pnpify",
      "prettier",
      "--stdin-filepath",
      util.escape_path(util.get_current_buffer_file_path()),
    },
    stdin = true,
  }
end

require("formatter").setup {
  logging = false,
  filetype = {
    go = {
      require("formatter.filetypes.go").gofmt,
      require("formatter.filetypes.go").goimports,
    },
    python = {
      require("formatter.filetypes.python").black,
      require("formatter.filetypes.python").isort,
    },
    json = {
      require("formatter.filetypes.json").prettier,
    },
    javascript = { format_yarn_pnp },
    typescript = { format_yarn_pnp },
    typescriptreact = { format_yarn_pnp },
  }
}

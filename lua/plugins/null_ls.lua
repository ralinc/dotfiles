local null_ls = require 'null-ls'

local is_yarn_pnp = function(utils)
  return utils.has_file '.pnp.cjs'
end

local is_yarn_classic = function(utils)
  return not is_yarn_pnp(utils)
end

null_ls.setup {
  debug = false,
  sources = {
    null_ls.builtins.formatting.prettier.with {
      condition = is_yarn_classic,
    },
    null_ls.builtins.formatting.prettier.with {
      condition = is_yarn_pnp,
      command = 'yarn',
      args = { 'prettier', '--stdin-filepath', '$FILENAME' },
    },

    null_ls.builtins.formatting.nginx_beautifier.with {
      args = { '-s', '2', '-i', '-o', '$FILENAME' },
    },

    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.goimports,

    null_ls.builtins.diagnostics.flake8,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,

    -- null_ls.builtins.diagnostics.rubocop.with {
    --   command = 'bundle',
    --   args = { 'exec', 'rubocop', '-f', 'json', '--force-exclusion', '--stdin', '$FILENAME' },
    -- },
    -- null_ls.builtins.formatting.rubocop.with {
    --   command = 'bundle',
    --   args = { 'exec', 'rubocop', '-a', '-f', 'quiet', '--stderr', '--stdin', '$FILENAME' },
    -- },

    null_ls.builtins.diagnostics.eslint.with {
      condition = is_yarn_classic,
    },
    null_ls.builtins.diagnostics.eslint.with {
      condition = is_yarn_pnp,
      command = 'yarn',
      args = { 'eslint', '-f', 'json', '--stdin', '--stdin-filename', '$FILENAME' },
    },

    null_ls.builtins.formatting.pg_format,

    null_ls.builtins.formatting.stylua.with {
      args = { '--indent-width', '2', '--indent-type', 'Spaces', '-' },
    },
  },
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { async = false }
        end,
      })
    end
  end,
}

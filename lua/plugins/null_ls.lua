local null_ls = require 'null-ls'

null_ls.setup {
  debug = false,
  sources = {
    null_ls.builtins.diagnostics.flake8,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,

    null_ls.builtins.diagnostics.rubocop,
    null_ls.builtins.formatting.rubocop,

    null_ls.builtins.diagnostics.eslint,
    -- null_ls.builtins.diagnostics.eslint.with {
    --   command = 'yarn',
    --   args = { 'eslint', '-f', 'json', '--stdin', '--stdin-filename', '$FILENAME' },
    -- },

    null_ls.builtins.formatting.prettier,
    -- null_ls.builtins.formatting.prettierd,

    null_ls.builtins.diagnostics.stylelint,
    -- null_ls.builtins.diagnostics.stylelint.with {
    --   command = 'yarn',
    --   args = { 'stylelint', '--formatter', 'json', '--stdin-filename', '$FILENAME' },
    -- },

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

local null_ls = require("null-ls")

null_ls.setup({
  debug = false,
  sources = {
    null_ls.builtins.diagnostics.flake8,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,

    null_ls.builtins.diagnostics.rubocop,
    null_ls.builtins.formatting.rubocop,

    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.diagnostics.stylelint,
    null_ls.builtins.formatting.prettier.with({
      filetypes = {
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "markdown",
        "scss",
        "typescript",
        "typescriptreact",
        "yaml",
      },
    }),

    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.goimports,

    null_ls.builtins.formatting.stylua.with({
      args = { "--indent-width", "2", "--indent-type", "Spaces", "-" },
    }),
  },
  on_attach = function(client, bufnr)
    if client.resolved_capabilities.document_formatting then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.formatting_seq_sync()
        end,
      })
    end
  end,
})

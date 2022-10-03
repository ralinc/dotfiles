local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
local on_attach = function(client)
  local opts = { noremap = true, silent = true, buffer = 0 }
  vim.keymap.set("n", "gl", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", ",a", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", ",d", "<cmd>Telescope diagnostics<cr>", opts)
  vim.keymap.set("n", ",e", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", ",f", vim.lsp.buf.formatting, opts)
  vim.keymap.set("n", ",h", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", ",n", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", ",p", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", ",q", vim.diagnostic.setloclist, opts)
  vim.keymap.set("n", ",rf", "<cmd>Telescope lsp_references<cr>", opts)
  vim.keymap.set("n", ",rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", ",s", vim.lsp.buf.signature_help, opts)

  client.server_capabilities.documentFormattingProvider = false
end

lspconfig.gopls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig.tsserver.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig.sumneko_lua.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

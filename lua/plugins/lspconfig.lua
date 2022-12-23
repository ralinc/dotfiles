local on_attach = function(client)
  local opts = { noremap = true, silent = true, buffer = 0 }
  vim.keymap.set('n', 'gl', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', ',a', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', ',d', '<cmd>Telescope diagnostics<cr>', opts)
  vim.keymap.set('n', ',e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', ',f', vim.lsp.buf.formatting, opts)
  vim.keymap.set('n', ',h', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', ',n', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', ',p', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ',q', vim.diagnostic.setloclist, opts)
  vim.keymap.set('n', ',rf', '<cmd>Telescope lsp_references<cr>', opts)
  vim.keymap.set('n', ',rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', ',s', vim.lsp.buf.signature_help, opts)

  client.server_capabilities.documentFormattingProvider = false
end

require('mason').setup()

local servers = { 'tsserver', 'gopls' }

require('mason-lspconfig').setup {
  ensure_installed = servers,
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local lspconfig = require 'lspconfig'

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT', path = runtime_path },
      diagnostics = { globals = { 'vim' } },
      workspace = { library = vim.api.nvim_get_runtime_file('', true) },
      telemetry = { enable = false },
    },
  },
}

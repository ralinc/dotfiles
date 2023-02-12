local on_attach = function(client)
  local opts = { noremap = true, silent = true, buffer = 0 }

  vim.keymap.set('n', ',d', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', ',r', vim.lsp.buf.references, opts)
  vim.keymap.set('n', ',e', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', ',n', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', ',p', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ',q', vim.diagnostic.setloclist, opts)
  vim.keymap.set('n', ',h', vim.lsp.buf.hover, opts)

  -- vim.keymap.set('n', ',s', vim.lsp.buf.signature_help, opts)
  -- vim.keymap.set('n', ',e', vim.diagnostic.open_float, opts)
  -- vim.keymap.set('n', ',a', vim.lsp.buf.code_action, opts)
  -- vim.keymap.set('n', ',l', vim.lsp.buf.declaration, opts)
  -- vim.keymap.set('n', ',t', vim.lsp.buf.type_definition, opts)
  -- vim.keymap.set('n', ',i', vim.lsp.buf.implementation, opts)
  -- vim.keymap.set('n', ',f', vim.lsp.buf.formatting, opts)

  client.server_capabilities.documentFormattingProvider = false
end

require('mason').setup()

local servers = {
  'gopls',
  'pyright',
  'tailwindcss',
  'tsserver',
}

require('mason-lspconfig').setup {
  ensure_installed = servers,
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local lspconfig = require 'lspconfig'

for _, server in ipairs(servers) do
  lspconfig[server].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

lspconfig.lua_ls.setup {
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

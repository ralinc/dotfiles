local on_attach = function(client)
  local o = { noremap = true, silent = true, buffer = 0 }

  vim.keymap.set('n', ',l', vim.lsp.buf.declaration, o)
  vim.keymap.set('n', ',d', vim.lsp.buf.definition, o)
  vim.keymap.set('n', ',r', vim.lsp.buf.references, o)
  vim.keymap.set('n', ',e', vim.lsp.buf.rename, o)
  vim.keymap.set('n', ',n', vim.diagnostic.goto_next, o)
  vim.keymap.set('n', ',p', vim.diagnostic.goto_prev, o)
  vim.keymap.set('n', ',q', vim.diagnostic.setloclist, o)
  vim.keymap.set('n', ',f', vim.diagnostic.open_float, o)
  vim.keymap.set('n', ',h', vim.lsp.buf.hover, o)
  vim.keymap.set('n', ',a', vim.lsp.buf.code_action, o)

  -- vim.keymap.set('n', ',s', vim.lsp.buf.signature_help, o)
  -- vim.keymap.set('n', ',t', vim.lsp.buf.type_definition, o)
  -- vim.keymap.set('n', ',i', vim.lsp.buf.implementation, o)

  client.server_capabilities.documentFormattingProvider = false
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

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

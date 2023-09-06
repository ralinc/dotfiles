local on_attach = function(client)
  local o = { noremap = true, silent = true, buffer = 0 }

  vim.keymap.set('n', ',d', vim.lsp.buf.definition, o)
  vim.keymap.set('n', ',t', vim.lsp.buf.type_definition, o)
  vim.keymap.set('n', ',i', vim.lsp.buf.implementation, o)
  vim.keymap.set('n', ',s', vim.lsp.buf.signature_help, o)
  vim.keymap.set('n', ',r', require('telescope.builtin').lsp_references, o)
  vim.keymap.set('n', ',e', vim.lsp.buf.rename, o)
  vim.keymap.set('n', ',h', vim.lsp.buf.hover, o)
  vim.keymap.set('n', ',a', vim.lsp.buf.code_action, o)

  vim.keymap.set('n', ',n', vim.diagnostic.goto_next, o)
  vim.keymap.set('n', ',p', vim.diagnostic.goto_prev, o)
  vim.keymap.set('n', ',q', vim.diagnostic.setloclist, o)
  vim.keymap.set('n', ',o', vim.diagnostic.open_float, o)

  vim.keymap.set('n', ',f', vim.lsp.buf.format, o)

  if client.name == 'rubocop' or client.name == 'lua_ls' then
    vim.cmd 'autocmd BufWritePre <buffer> lua vim.lsp.buf.format { async = false }'
  end
end

local servers = {
  eslint = {},
  gopls = {},
  pyright = {},
  tailwindcss = {},
  tsserver = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

local lspconfig = require 'lspconfig'

mason_lspconfig.setup_handlers {
  function(server_name)
    lspconfig[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end
}

lspconfig.rubocop.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

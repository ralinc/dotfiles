local cmp = require 'cmp'
local luasnip = require 'luasnip'

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<Tab>'] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true },
  },
  sources = {
    { name = 'nvim_lsp', keyword_length = 3 },
    { name = 'luasnip' },
    { name = 'path' },
    {
      name = 'buffer',
      keyword_length = 3,
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end,
      },
    },
  },
}

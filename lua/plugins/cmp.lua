local cmp = require("cmp")

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<tab>"] = cmp.mapping.confirm({ select = true }),
  }),
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  sources = {
    { name = "nvim_lua" },
    { name = "nvim_lsp", keyword_length = 4 },
    { name = "path" },
    { name = "luasnip" },
    { name = "buffer", keyword_length = 4 },
  },
})

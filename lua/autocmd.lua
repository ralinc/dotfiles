vim.api.nvim_create_autocmd('FileType', {
  callback = function(event)
    local lang = vim.treesitter.language.get_lang(event.match)
    if pcall(vim.treesitter.start) and vim.treesitter.query.get(lang, 'indents') then
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})

for pattern, cmd in pairs {
  ['messages/**/*.yml'] = 'npm run messages',
  ['config/locales/gamma.en.yml'] = 'bin/rake codegen:translations',
} do
  vim.api.nvim_create_autocmd('BufWritePost', {
    pattern = pattern,
    callback = function()
      vim.fn.jobstart(cmd, {
        on_exit = function(_, exit_code)
          print(cmd .. (exit_code == 0 and ': ok' or ': failed'))
        end,
      })
    end,
  })
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(event)
    local map = function(keys, func)
      vim.keymap.set('n', keys, func, { buffer = event.buf })
    end

    local builtin = require 'telescope.builtin'

    map(',d', builtin.lsp_definitions)
    map(',t', builtin.lsp_type_definitions)
    map(',i', builtin.lsp_implementations)
    map(',s', vim.lsp.buf.signature_help)
    map(',r', builtin.lsp_references)
    map(',e', vim.lsp.buf.rename)
    map(',h', vim.lsp.buf.hover)
    map(',a', vim.lsp.buf.code_action)
    map(',n', function()
      vim.diagnostic.jump { count = 1 }
    end)
    map(',p', function()
      vim.diagnostic.jump { count = -1 }
    end)
    map(',q', vim.diagnostic.setloclist)
    map(',o', vim.diagnostic.open_float)
  end,
})

vim.keymap.set('n', ',f', function()
  require('conform').format { lsp_format = 'fallback' }
end)

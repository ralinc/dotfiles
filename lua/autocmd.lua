vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, { pattern = '*.md', command = 'setl filetype=markdown' })
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, { pattern = '*.slim', command = 'setl filetype=slim' })
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, { pattern = '*.go', command = 'setl noet ts=2 sw=2 sts=2' })

vim.api.nvim_create_autocmd('FileType', { pattern = 'markdown', command = 'setl spell nolist wrap lbr textwidth=80' })
vim.api.nvim_create_autocmd('FileType', { pattern = 'gitcommit', command = 'setl spell textwidth=72' })
vim.api.nvim_create_autocmd('FileType', { pattern = 'slim', command = 'setl noet ts=2 sw=2 sts=2' })

vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('build-messages', { clear = true }),
  pattern = { 'messages/**/*.yml' },
  callback = function()
    vim.fn.jobstart('npm run build:messages', {
      on_exit = function(_, exit_code)
        if exit_code == 0 then
          print 'build:messages:ok'
        else
          print 'build:messages:failed'
        end
      end,
    })
  end,
})

vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('codegen-translations', { clear = true }),
  pattern = { 'config/locales/gamma.en.yml' },
  callback = function()
    vim.fn.jobstart('bin/rake codegen:translations', {
      on_exit = function(_, exit_code)
        if exit_code == 0 then
          print 'codegen:translations:ok'
        else
          print 'codegen:translations:failed'
        end
      end,
    })
  end,
})

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
    map(',n', vim.diagnostic.goto_next)
    map(',p', vim.diagnostic.goto_prev)
    map(',q', vim.diagnostic.setloclist)
    map(',o', vim.diagnostic.open_float)
    map(',f', vim.lsp.buf.format)

    local client = assert(vim.lsp.get_client_by_id(event.data.client_id))

    if client:supports_method 'textDocument/completion' then
      vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
    end

    if
      client.name ~= 'ts_ls'
      and client:supports_method 'textDocument/formatting'
      and not client:supports_method 'textDocument/willSaveWaitUntil'
    then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
        buffer = event.buf,
        callback = function()
          vim.lsp.buf.format { bufnr = event.buf, id = client.id, timeout_ms = 1000 }
        end,
      })
    end
  end,
})

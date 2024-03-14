vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, { pattern = '*.md', command = 'setl filetype=markdown' })
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, { pattern = '*.slim', command = 'setl filetype=slim' })
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, { pattern = '*.go', command = 'setl noet ts=2 sw=2 sts=2' })

vim.api.nvim_create_autocmd('FileType', { pattern = 'markdown', command = 'setl spell nolist wrap lbr textwidth=80' })
vim.api.nvim_create_autocmd('FileType', { pattern = 'gitcommit', command = 'setl spell textwidth=72' })
vim.api.nvim_create_autocmd('FileType', { pattern = 'slim', command = 'setl noet ts=2 sw=2 sts=2' })

vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('build-messages', { clear = true }),
  pattern = { 'messages/en.yml', 'messages/de.yml', 'messages/bg.yml' },
  callback = function()
    vim.fn.jobstart('yarn build:messages', {
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

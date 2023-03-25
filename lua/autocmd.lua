vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, { pattern = '*.md', command = 'setl filetype=markdown' })
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, { pattern = '*.slim', command = 'setl filetype=slim' })
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, { pattern = '*.go', command = 'setl noet ts=2 sw=2 sts=2' })
vim.api.nvim_create_autocmd('FileType', { pattern = 'markdown', command = 'setl spell nolist wrap lbr textwidth=80' })
vim.api.nvim_create_autocmd('FileType', { pattern = 'gitcommit', command = 'setl spell textwidth=72' })

-- vim.api.nvim_create_autocmd('BufWritePost', {
--   group = vim.api.nvim_create_augroup('aoc', { clear = true }),
--   pattern = 'main.go',
--   callback = function()
--     vim.fn.jobstart({ 'go', 'run', vim.api.nvim_buf_get_name(0) }, {
--       stdout_buffered = true,
--       on_stdout = function(_, data)
--         if data then
--           vim.cmd 'vsplit'
--           local win = vim.api.nvim_get_current_win()
--           local buf = vim.api.nvim_create_buf(false, true)
--           vim.api.nvim_buf_set_lines(buf, 0, -1, false, data)
--           vim.api.nvim_win_set_buf(win, buf)
--         end
--       end,
--     })
--   end,
-- })

vim.g.copilot_filetypes = { markdown = false }
vim.g.copilot_no_tab_map = true

vim.cmd [[imap <silent><script><expr> <C-o> copilot#Accept("")]]

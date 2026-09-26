local tb = require 'telescope.builtin'
vim.keymap.set('n', '<C-p>', tb.find_files)
vim.keymap.set('n', '<leader>fa', function()
  tb.find_files { cwd = vim.fn.getcwd() .. '/' .. vim.fn.input('> ', '', 'dir') }
end)
vim.keymap.set('n', '<leader>f', tb.live_grep)
vim.keymap.set('n', '<leader>ff', function()
  tb.live_grep { search_dirs = { vim.fn.expand '%:p:h' } }
end)
vim.keymap.set('n', '<leader>fd', function()
  tb.live_grep { search_dirs = { vim.fn.input('> ', '', 'dir') } }
end)
vim.keymap.set('n', '<leader>fw', tb.grep_string)
vim.keymap.set('n', '<leader>fb', tb.buffers)
vim.keymap.set('n', '<leader>fr', tb.lsp_references)
vim.keymap.set('n', '<leader>fs', tb.treesitter)
vim.keymap.set('n', '<leader>fe', tb.diagnostics)
vim.keymap.set('n', '<leader>fh', tb.help_tags)
vim.keymap.set('n', '<leader>fm', tb.keymaps)
vim.keymap.set('n', '<leader>fo', tb.vim_options)
vim.keymap.set('n', '<leader>fg', tb.git_commits)
vim.keymap.set('n', '<leader>fc', tb.colorscheme)

vim.keymap.set('n', '<leader>o', function()
  require('nvim-tree.api').tree.toggle { find_file = true }
end)

vim.keymap.set('n', '<leader>gb', ':G blame<CR>')
vim.keymap.set('n', '<leader>gd', ':Gdiff :0<CR>')
vim.keymap.set('n', '<leader>ga', ':Git difftool -y<CR>')
vim.keymap.set('n', '<leader>go', ':Git difftool -y --merge-base origin/HEAD<CR>')

vim.keymap.set('n', '<leader>ra', ':A<CR>')
vim.keymap.set('n', '<leader>rr', ':R<CR>')
vim.keymap.set('n', '<leader>em', ':Emodel ')
vim.keymap.set('n', '<leader>eg', ':Emigration<CR>')
vim.keymap.set('n', '<leader>es', ':Eschema<CR>')
vim.keymap.set('n', '<leader>er', ':Einitializer<CR>')
vim.keymap.set('n', '<leader>vm', ':Vmodel ')
vim.keymap.set('n', '<leader>vs', ':Vschema<CR>')
vim.keymap.set('n', '<leader>vr', ':Vinitializer<CR>')

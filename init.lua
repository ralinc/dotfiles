vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

dofile(vim.fn.stdpath 'config' .. '/init.min.lua')

vim.lsp.enable { 'lua_ls', 'rubocop', 'ruff_ls', 'ts_ls', 'tw_ls' }

require 'plugins'
require 'mappings'
require 'autocmd'
require 'spec'

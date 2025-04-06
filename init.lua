vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = false
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd 'filetype plugin indent on'
vim.cmd 'syntax on'

vim.lsp.config('*', { root_markers = { '.git' } })
vim.lsp.enable { 'lua_ls', 'ruby_ls', 'ruff_ls', 'ts_ls', 'tw_ls' }

require 'plugins'
require 'options'
require 'mappings'
require 'autocmd'

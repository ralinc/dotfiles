vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = false
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd 'filetype plugin indent on'
vim.cmd 'syntax on'

vim.filetype.add { extension = { mq5 = 'cpp', mqh = 'cpp', mq4 = 'cpp' } }

vim.lsp.config('*', { root_markers = { '.git' } })
vim.lsp.enable { 'eslint_ls', 'lua_ls', 'ruby_ls', 'ruff_ls', 'ts_ls', 'tw_ls' }

require 'plugins'
require 'options'
require 'mappings'
require 'autocmd'
require 'rename'
require 'spec'

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd [[ syntax on ]]
vim.cmd [[ filetype plugin indent on ]]
vim.cmd [[ colorscheme jellybeans ]]

require 'autocmd'
require 'keybindings'
require 'options'
require 'plugins'

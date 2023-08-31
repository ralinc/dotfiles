vim.g.mapleader = ' '

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd 'filetype plugin indent on'
vim.cmd 'syntax on'

require 'autocmd'
require 'mappings'
require 'options'
require 'plugins'

-- vim.cmd.colorscheme 'jellybeans'
vim.cmd.colorscheme 'rose-pine'

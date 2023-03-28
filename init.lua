vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd 'filetype plugin indent on'
vim.cmd 'syntax on'

require 'autocmd'
require 'keybindings'
require 'options'
require 'plugins'

-- vim.cmd.colorscheme 'jellybeans'
vim.cmd.colorscheme 'rose-pine'
-- vim.cmd.colorscheme 'tokyonight'
-- vim.cmd.colorscheme 'tokyonight-night'

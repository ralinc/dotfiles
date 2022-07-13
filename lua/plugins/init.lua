vim.cmd([[
packadd minpac
call minpac#init()

call minpac#add('christoomey/vim-tmux-navigator')
call minpac#add('christoomey/vim-tmux-runner')
call minpac#add('jose-elias-alvarez/null-ls.nvim')
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('L3MON4D3/LuaSnip')
call minpac#add('neovim/nvim-lspconfig')
call minpac#add('nvim-lua/plenary.nvim')
call minpac#add('hrsh7th/cmp-buffer')
call minpac#add('hrsh7th/cmp-nvim-lsp')
call minpac#add('hrsh7th/cmp-path')
call minpac#add('hrsh7th/nvim-cmp')
call minpac#add('mileszs/ack.vim')
call minpac#add('nvim-lualine/lualine.nvim')
call minpac#add('nvim-telescope/telescope.nvim')
call minpac#add('nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'})
call minpac#add('nanotech/jellybeans.vim')
call minpac#add('saadparwaiz1/cmp_luasnip')
call minpac#add('scrooloose/nerdtree')
call minpac#add('slim-template/vim-slim')
call minpac#add('thoughtbot/vim-rspec')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-endwise')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-surround')

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
]])

require("plugins/cmp")
require("plugins/lspconfig")
require("plugins/null_ls")

vim.cmd([[
let g:NERDTreeWinSize = 50
let g:NERDTreeMapOpenVSplit = 'v'
let g:NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules']

let g:ackprg = 'ag --nogroup --nocolor --column'

let g:rspec_command = "VtrSendCommandToRunner! bundle exec rspec {spec}"

let g:VtrStripLeadingWhitespace = 0
let g:VtrClearEmptyLines = 0
let g:VtrAppendNewline = 1
]])

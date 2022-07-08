"===============================================
" Author: Ralin Chimev [https://ralin.io]
" Source: https://github.com/ralinc/dotfiles
"-----------------------------------------------

syntax on

filetype plugin indent on

colorscheme jellybeans


packadd minpac
call minpac#init()

call minpac#add('christoomey/vim-tmux-navigator')
call minpac#add('christoomey/vim-tmux-runner')
call minpac#add('jose-elias-alvarez/null-ls.nvim')
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('neovim/nvim-lspconfig')
call minpac#add('nvim-lua/plenary.nvim')
call minpac#add('hrsh7th/cmp-buffer')
call minpac#add('hrsh7th/cmp-nvim-lsp')
call minpac#add('hrsh7th/cmp-path')
call minpac#add('hrsh7th/nvim-cmp')
call minpac#add('nvim-lualine/lualine.nvim')
call minpac#add('nvim-telescope/telescope.nvim')
call minpac#add('nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'})
call minpac#add('nanotech/jellybeans.vim')
call minpac#add('scrooloose/nerdtree')
call minpac#add('thoughtbot/vim-rspec')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-surround')

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()


au BufNewFile,BufRead *.md setlocal filetype=markdown

au FileType markdown setlocal spell nolist wrap lbr textwidth=80
au Filetype gitcommit setlocal spell textwidth=72


let g:NERDTreeWinSize = 50
let g:NERDTreeMapOpenVSplit = 'v'
let g:NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules']

let g:rspec_command = "VtrSendCommandToRunner! bundle exec rspec {spec}"

let g:VtrStripLeadingWhitespace = 0
let g:VtrClearEmptyLines = 0
let g:VtrAppendNewline = 1

lua << END
require('keybindings')
require('options')
require('plugins')
require('lualine').setup()
END

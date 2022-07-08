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


let mapleader = " "

imap jk <esc>
nmap j gj
nmap k gk

map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

map <C-n> :NERDTreeToggle<cr>
map <C-n>f :NERDTreeFind<cr>

nnoremap <leader>q :q<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>n :noh<cr>
nnoremap <leader><leader> <C-^>

nnoremap <leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<cr>
nnoremap <leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<cr>
nnoremap <leader>x :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<cr>

nnoremap <leader>zv <C-w>\|
nnoremap <leader>z0 <C-w>=

nnoremap <leader>qo :copen<cr>
nnoremap <leader>qc :ccl<cr>

nnoremap <leader>b :G blame<cr>
nnoremap <leader>d :Gdiff :0<cr>

nnoremap <leader>sp :set paste<cr>
nnoremap <leader>np :set nopaste<cr>

nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>f <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fw <cmd>lua require('telescope.builtin').grep_string()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>

nnoremap <leader>to :VtrOpenRunner<cr>
nnoremap <leader>tk :VtrKillRunner<cr>
nnoremap <leader>tf :VtrFocusRunner<cr>

nnoremap <leader>sn :call RunNearestSpec()<cr>
nnoremap <leader>sf :call RunCurrentSpecFile()<cr>
nnoremap <leader>sl :call RunLastSpec()<cr>
nnoremap <leader>sa :call RunAllSpecs()<cr>

nnoremap <leader>es :e db/structure.sql<cr>
nnoremap <leader>vs :vnew db/structure.sql<cr>
nnoremap <leader>ed :e Dockerfile<cr>

nnoremap <leader>md :!mkdir -p %:h<cr>
nnoremap <leader>p obinding.pry<esc>:w<cr>
nnoremap <leader>c vapgq

nnoremap <leader>li :LspInfo<cr>
nnoremap <leader>ni :NullLsInfo<cr>

nnoremap <leader>so :source ~/.config/nvim/init.vim<cr>


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
require('options')
require('plugins')
require('lualine').setup()
END

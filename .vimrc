"===========================================================================

"===========================================================================
" Author: Ralin Chimev [http://www.ralin.net]
" Source: https://github.com/ralinc/dotfiles
"
" My .vimrc, mostly for rails & javascript development. 
"---------------------------------------------------------------------

set encoding=utf-8 nobomb
scriptencoding utf-8

nmap j gj
nmap k gk
nmap 9 ^
nmap 0 $
imap jk <esc>:w<cr>
map <C-n> :NERDTreeToggle<CR>

let mapleader = "\<Space>"

nmap <Leader>so :source $MYVIMRC<cr>
nmap <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<cr>
nmap <Leader>s :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<cr>
nmap <Leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<cr>
nmap <Leader>h <C-W>h
nmap <Leader>j <C-W>j
nmap <Leader>k <C-W>k
nmap <Leader>l <C-W>l
nmap <Leader>m ]m
nmap <Leader>n [m

set backspace=indent,eol,start
set ruler
set showcmd
set showmatch
set nowrap
set autoread
set autowrite
set wmh=0
set viminfo+=!
set guioptions-=T
set et
set sw=2
set smarttab
set noincsearch
set ignorecase smartcase
set number
set autoindent
set lazyredraw
set nocompatible
set scrolloff=8
set sidescrolloff=16
set colorcolumn=80
set tabstop=2 shiftwidth=2 expandtab
set secure
set vb
set noswapfile
set hlsearch
set grepprg=ag
set nofoldenable
set laststatus=2
set novisualbell
set noerrorbells
set grepprg=ag\ --nogroup\ --nocolor
" set rtp+=~/.fzf

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'skwp/greplace.vim'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'tomtom/tcomment_vim'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'thoughtbot/vim-rspec'
Plug 'ngmy/vim-rubocop'
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'mxw/vim-jsx'
Plug 'kchmck/vim-coffee-script'
Plug 'JulesWang/css.vim'
         \| Plug 'hail2u/vim-css3-syntax'
         \| Plug 'cakebaker/scss-syntax.vim'
Plug 'slim-template/vim-slim'
Plug 'elzr/vim-json'
Plug 'ingydotnet/yaml-vim'
Plug 'maksimr/vim-jsbeautify'
Plug 'nanotech/jellybeans.vim'
Plug 'danro/rename.vim'
call plug#end()

filetype plugin indent on
colorscheme jellybeans
syntax on

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_match_window = 'results:100'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_ruby_checkers = ['rubocop']

let g:NERDTreeWinSize = 50

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd FileType markdown setlocal nolist wrap lbr
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd FileType ruby,eruby,yaml setlocal ai sw=2 sts=2 et
autocmd FileType ruby,eruby,yaml setlocal path+=lib
autocmd FileType ruby,eruby,yaml setlocal colorcolumn=80
autocmd FileType ruby,eruby,yaml setlocal iskeyword+=?
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

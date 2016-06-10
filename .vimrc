"===========================================================================
"                                ~My vimrc~
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

let mapleader = "\<Space>"

nmap <Leader>so :source $MYVIMRC<cr>
nmap <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<cr>
nmap <Leader>s :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<cr>
nmap <Leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<cr>
nmap <Leader>h <C-W>h
nmap <Leader>j <C-W>j
nmap <Leader>k <C-W>k
nmap <Leader>l <C-W>l
nmap <Leader>9 <C-W>-
nmap <Leader>0 <C-W>+
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

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ervandew/supertab'
Plugin 'skwp/greplace.vim'
Plugin 'tpope/vim-surround'
Plugin 'tomtom/tcomment_vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'ngmy/vim-rubocop'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'mxw/vim-jsx'
Plugin 'kchmck/vim-coffee-script'
Plugin 'JulesWang/css.vim'
         \| Plugin 'hail2u/vim-css3-syntax'
         \| Plugin 'cakebaker/scss-syntax.vim'
Plugin 'slim-template/vim-slim'
Plugin 'elzr/vim-json'
Plugin 'ingydotnet/yaml-vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'nanotech/jellybeans.vim'
call vundle#end() 
filetype plugin indent on

colorscheme jellybeans
syntax on

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_ruby_checkers = ['rubocop']

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

let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_match_window = 'results:100'

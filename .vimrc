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
imap jk <esc>

map <C-n> :NERDTreeToggle<CR>
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

let mapleader = "\<Space>"

map <Leader>so :source $MYVIMRC<CR>
map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
map <Leader>h :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
map <Leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
map <Leader>n ]m
map <Leader>m [m
map <Leader>i mmgg=G`m<CR>
map <Leader>p :set paste<CR><esc>"*]p:set nopaste<CR>
map <Leader>ct :!ctags -R .<CR>
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>w :w<CR>

set splitbelow
set splitright
set backspace=indent,eol,start
set nobackup
set nowritebackup
set noswapfile
set history=50
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
set incsearch
set ignorecase
set smartcase
set number
set autoindent
set lazyredraw
set nocompatible
set scrolloff=8
set sidescrolloff=16
set colorcolumn=80
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set secure
set vb
set hlsearch
set grepprg=ag\ --nogroup\ --nocolor
set nofoldenable
set laststatus=2
set novisualbell
set noerrorbells
set wildignore+=tmp/**
set list listchars=tab:»·,trail:·,nbsp:·
set textwidth=80
set numberwidth=5
set wildmode=list:longest,list:full
set diffopt+=vertical

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-ruby/vim-ruby'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-rails'
Plug 'tpope/rbenv-ctags'
Plug 'thoughtbot/vim-rspec'
Plug 'ngmy/vim-rubocop'
Plug 'ervandew/supertab'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'mxw/vim-jsx'
Plug 'danro/rename.vim'
Plug 'skwp/greplace.vim'
Plug 'nanotech/jellybeans.vim'
call plug#end()

syntax on
filetype plugin indent on
colorscheme jellybeans
runtime macros/matchit.vim

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

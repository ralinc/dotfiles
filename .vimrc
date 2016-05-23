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

nmap 9 ^
nmap 0 $
imap jk <esc>

let mapleader = "\<Space>"

nmap <leader>vr :sp $MYVIMRC<cr>
nmap <leader>so :source $MYVIMRC<cr>
nmap <leader>v :vnew <C-r>=escape(expand("%:p:h"), ' ') . '/'<cr>

let g:vimrubocop_keymap = 0
nmap <Leader>r :RuboCop<CR>

filetype off

set number
set nocompatible
set autoread
set autoindent
set copyindent
set backspace=indent,eol,start
set scrolloff=8
set sidescrolloff=16
set colorcolumn=80
set tabstop=2 shiftwidth=2 expandtab
set secure
set autowrite
set vb
set guioptions-=T
set guioptions+=c
set rtp+=~/.vim/bundle/Vundle.vim
set nowrap
set noswapfile

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'thoughtbot/vim-rspec'
Plugin 'ngmy/vim-rubocop'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'mxw/vim-jsx'
Plugin 'kchmck/vim-coffee-script'
Plugin 'altercation/vim-colors-solarized'
Plugin 'morhetz/gruvbox'
Plugin 'JulesWang/css.vim'
         \| Plugin 'hail2u/vim-css3-syntax'
         \| Plugin 'cakebaker/scss-syntax.vim'
Plugin 'ingydotnet/yaml-vim'
Plugin 'maksimr/vim-jsbeautify'
call vundle#end() 
filetype plugin indent on

syntax enable

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['jshint']

autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>


let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_match_window = 'results:100'

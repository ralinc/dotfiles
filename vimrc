"===========================================================================

"===========================================================================
" Author: Ralin Chimev [http://www.ralin.net]
" Source: https://github.com/ralinc/dotfiles
"
" My .vimrc, mostly for ruby, python & javascript development.
"---------------------------------------------------------------------

function! s:SourceConfigFiles()
  for config_file in split(glob('~/.vim/*.vim'), '\n')
    if filereadable(config_file)
      execute 'source' config_file
    endif
  endfor
endfunction

call s:SourceConfigFiles()

syntax on
filetype plugin indent on
colorscheme jellybeans
runtime macros/matchit.vim

let g:fzf_layout = { 'down': '~33%' }
let g:ackprg = 'ag --nogroup --nocolor --column'

let g:NERDTreeWinSize = 50
let g:NERDTreeMapOpenSplit = 'h'
let g:NERDTreeMapOpenVSplit = 'v'
let g:NERDTreeIgnore=['\.pyc$', '\~$']

let g:syntastic_loc_list_height = 5
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_scss_sass_quiet_messages = {
    \ "regex": [
    \   'File to import not found or unreadable',
    \   'Undefined (mixin|variable)',
    \ ]}

let g:jsx_ext_required = 0
let g:rspec_command = "!bundle exec rspec {spec}"
let g:ycm_autoclose_preview_window_after_completion=1
let python_highlight_all=1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

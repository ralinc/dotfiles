"===========================================================================

"===========================================================================
" Author: Ralin Chimev [http://www.ralin.net]
" Source: https://github.com/ralinc/dotfiles
"
" My .vimrc, mostly for ruby & javascript development. 
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

py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

let g:fzf_layout = { 'down': '~33%' }
let g:ackprg = 'ag --nogroup --nocolor --column'

let g:NERDTreeWinSize = 50
let g:NERDTreeMapOpenSplit = 'h'
let g:NERDTreeMapOpenVSplit = 'v'
let g:NERDTreeIgnore=['\.pyc$', '\~$']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_scss_sass_quiet_messages = {
    \ "regex": [
    \   'File to import not found or unreadable',
    \   'Undefined (mixin|variable)',
    \ ]}

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

let g:jsx_ext_required = 0

let g:rspec_command = '!bundle exec rspec {spec}'
" let g:rspec_command = "Dispatch bundle exec rspec {spec}"
" let g:rspec_command = "VtrSendCommandToRunner! bundle exec rspec {spec}"

let python_highlight_all=1
let g:ycm_autoclose_preview_window_after_completion=1
let g:flake8_show_quickfix=0

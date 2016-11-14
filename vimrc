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

let g:fzf_layout = { 'down': '~33%' }
let g:ackprg = 'ag --nogroup --nocolor --column'

let g:NERDTreeWinSize = 50
let g:NERDTreeMapOpenSplit = 'h'
let g:NERDTreeMapOpenVSplit = 'v'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_scss_sass_quiet_messages = { "regex": 'Undefined variable' }
let g:syntastic_error_symbol = '❌'
let g:syntastic_warning_symbol = '⚠️'

let g:jsx_ext_required = 0

" let g:rspec_command = "Dispatch bundle exec rspec {spec}"
" let g:rspec_command = '!bundle exec rspec {spec}'
let g:rspec_command = "VtrSendCommandToRunner! bundle exec rspec {spec}"

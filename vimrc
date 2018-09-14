"===============================================
" Author: Ralin Chimev [http://www.ralin.net]
" Source: https://github.com/ralinc/dotfiles
"-----------------------------------------------

function! s:SourceConfigFiles()
  for config_file in split(glob('~/.vim/*.vim'), '\n')
    if filereadable(config_file)
      execute 'source' config_file
    endif
  endfor
endfunction

call s:SourceConfigFiles()

colorscheme jellybeans

filetype plugin indent on
syntax on

runtime macros/matchit.vim

let g:airline#extensions#default#layout = [['c', 'x' ], ['z', 'error', 'warning']]

let g:fzf_layout = {'down': '~33%'}
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
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_sass_checkers=["sasslint"]
let g:syntastic_scss_checkers=["sasslint"]
let g:syntastic_eruby_ruby_quiet_messages = {'regex': 'possibly useless use of a variable in void context'}

let g:jsx_ext_required = 0

let g:rspec_command = "VtrSendCommandToRunner! bundle exec rspec {spec}"

let python_highlight_all=1

let g:terraform_align=1
let g:terraform_fmt_on_save=1

let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

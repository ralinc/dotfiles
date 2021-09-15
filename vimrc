"===============================================
" Author: Ralin Chimev [https://ralin.io]
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

set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

let g:NERDTreeWinSize = 50
let g:NERDTreeMapOpenSplit = 'h'
let g:NERDTreeMapOpenVSplit = 'v'
let g:NERDTreeIgnore=['\.pyc$', '\~$']

let g:jsx_ext_required = 0

let g:rspec_command = "VtrSendCommandToRunner! bundle exec rspec {spec}"

let g:VtrStripLeadingWhitespace = 0
let g:VtrClearEmptyLines = 0
let g:VtrAppendNewline = 1

let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

let g:go_fmt_command = "goimports"

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_linters_explicit = 1
let g:ale_virtualenv_dir_names = []
let g:ale_php_cs_fixer_use_global = 1
let g:ale_fixers = {
\    '*': ['remove_trailing_lines', 'trim_whitespace'],
\    'css': ['prettier'],
\    'scss': ['prettier'],
\    'html': ['prettier'],
\    'javascript': ['prettier'],
\    'php': ['php_cs_fixer'],
\    'python': ['black', 'isort'],
\    'ruby': ['rubocop'],
\  }
let g:ale_linters = {
\    'css': ['stylelint'],
\    'scss': ['stylelint'],
\    'javascript': ['eslint'],
\    'jsx': ['eslint'],
\    'go': ['gofmt'],
\    'php': ['php'],
\    'python': ['flake8'],
\    'ruby': ['rubocop'],
\  }
let g:airline#extensions#ale#enabled = 1

set statusline+=%#warningmsg#
set statusline+=%*

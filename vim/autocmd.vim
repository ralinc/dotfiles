au VimResized * :wincmd =
au BufReadCmd set nohlsearch
au BufNewFile,BufRead *.slim setlocal filetype=slim
au BufNewFile,BufRead *.html,*.css,*.js
    \ setlocal tabstop=2     |
    \ setlocal softtabstop=2 |
    \ setlocal shiftwidth=2
au BufNewFile,BufRead *.md
    \ setlocal filetype=markdown |
    \ setlocal textwidth=80
au BufNewFile,BufRead *.py
    \ setlocal tabstop=4      |
    \ setlocal softtabstop=4  |
    \ setlocal shiftwidth=4   |
    \ setlocal textwidth=120  |
    \ setlocal expandtab      |
    \ setlocal autoindent     |
    \ setlocal fileformat=unix
au FileType markdown setlocal nolist wrap lbr
au Filetype gitcommit setlocal spell textwidth=72
au FileType ruby,eruby,yaml setlocal ai sw=2 sts=2 et
au FileType ruby,eruby,yaml setlocal path+=lib
au FileType ruby,eruby,yaml setlocal colorcolumn=80
au FileType ruby,eruby,yaml setlocal iskeyword+=?
au FileType python setlocal ai et si sw=4 sts=4
au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
au FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
au FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
au FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
au FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
au FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
au BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
au BufEnter * EnableStripWhitespaceOnSave
au BufWritePost *.py call Flake8()

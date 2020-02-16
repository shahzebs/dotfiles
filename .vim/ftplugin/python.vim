""" Python configs

let python_highlight_all = 1
syntax keyword pythonDecorator True None False self

autocmd BufNewFile *.py :normal iimport numpy as np
nnoremap <F5> :w<CR>:!clear;python3 %<CR>

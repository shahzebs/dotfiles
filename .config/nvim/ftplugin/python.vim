""" Python configs

let python_highlight_all = 1
syntax keyword pythonDecorator True None False self

nnoremap <F5> :w<CR>:!clear; python3 % \| less <CR><CR>

""" Python
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

autocmd BufNewFile *.py :normal iimport numpy as np
autocmd BufNewFile *.py :normal o
autocmd FileType python :nnoremap <F5> :w<CR>:!clear;python3 %<CR>

""" LaTeX 
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_latexmk = {
            \ 'build_dir' : 'build',
            \}
let g:tex_conceal = ""

autocmd FileType tex colorscheme badwolf
autocmd FileType tex setlocal spell spelllang=en_us | hi clear SpellBad | hi clear SpellRare | hi clear SpellCap | hi SpellBad cterm=underline ctermfg=red
autocmd FileType tex inoremap <C-\> \(\)<Esc>hi
autocmd FileType tex inoremap `/ \frac{}{}<Esc>hhi
autocmd FileType tex nnoremap <leader>bb ciw\begin{<C-R>"}<CR>\end{<C-R>"}<Esc>kA
autocmd FileType tex inoremap <leader>bb <Esc>ciw\begin{<C-R>"}<CR>\end{<C-R>"}<Esc>kA
autocmd FileType tex nnoremap cim /\\)<CR>%lc/\\)<CR><ESC>:noh<CR>li

""" Bash
autocmd BufNewFile *.sh norm i#!/bin/bash

""" C++
" Sets omnifunc to language-based completion, but only in the case of cpp-files (python files have good completion by 'default', it's probably a plug-in's fault)
autocmd FileType cpp setlocal omnifunc=syntaxcomplete#Complete

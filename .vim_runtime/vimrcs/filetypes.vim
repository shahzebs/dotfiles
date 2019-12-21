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
autocmd FileType tex hi Normal ctermbg=none | hi EndOfBuffer ctermbg=none ctermfg=243 | hi LineNr ctermbg=none | hi FoldColumn ctermbg=none
autocmd FileType tex setlocal spell spelllang=en_us | hi clear SpellBad | hi clear SpellRare | hi clear SpellCap | hi SpellBad cterm=underline ctermfg=red
autocmd FileType tex inoremap <C-\> \(\)<++><Esc>F\i
autocmd FileType tex inoremap `/ \frac{}{<++>}<++><Esc>F{hi
autocmd FileType tex nnoremap <leader>bb "tciw\begin{<C-R>"}<CR>\end{<C-R>"}<Esc>kA
autocmd FileType tex inoremap <leader>bb <Esc>"tciw\begin{<C-R>"}<CR>\end{<C-R>"}<Esc>kA
autocmd FileType tex nnoremap cim /\\)<CR>%lc/\\)<CR><ESC>:noh<CR>li
autocmd FileType tex nnoremap ;f i\begin{figure}[]<CR>\centering<CR>\includegraphics[width=<++>\textwidth]{<++>}<CR>\caption{<++>}<CR>\label{fig:<++>}<CR>\end{figure}<CR><++><ESC>?\\begin<CR>:noh<CR>f[a
autocmd FileType tex inoremap ;f \begin{figure}[]<CR>\centering<CR>\includegraphics[width=<++>\textwidth]{<++>}<CR>\caption{<++>}<CR>\label{fig:<++>}<CR>\end{figure}<CR><++><ESC>?\\begin<CR>:noh<CR>f[a

autocmd FileType bib nnoremap ;b i@Book{,<CR>publisher = {<++>},<CR>isbn = {<++>},<CR>year = {<++>},<CR>title = {<++>},<CR>author = {<++>},<CR>}<ESC>%li
autocmd FileType bib inoremap ;b @Book{,<CR>publisher = {<++>},<CR>isbn = {<++>},<CR>year = {<++>},<CR>title = {<++>},<CR>author = {<++>},<CR>}<ESC>%li

""" Bash
autocmd BufNewFile *.sh norm i#!/bin/bash

""" C++
" Sets omnifunc to language-based completion, but only in the case of cpp-files (python files have good completion by 'default', it's probably a plug-in's fault)
autocmd FileType cpp setlocal omnifunc=syntaxcomplete#Complete

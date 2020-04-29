""" LaTeX configs

let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_latexmk = {
            \ 'build_dir' : 'build',
            \}
let g:tex_conceal = ""

colorscheme badwolf
hi Normal ctermbg=none | hi EndOfBuffer ctermbg=none ctermfg=243 | hi LineNr ctermbg=none | hi FoldColumn ctermbg=none

setlocal spell spelllang=en_us | hi clear SpellBad | hi clear SpellRare | hi clear SpellCap | hi SpellBad cterm=underline ctermfg=red

inoremap <C-\> \(\)<++><Esc>F\i
inoremap `/ \frac{}{<++>}<++><Esc>F{hi
nnoremap cim /\\)<CR>%lc/\\)<CR><ESC>:noh<CR>li

nnoremap ;bb "tciw\begin{<C-R>"}<CR>\end{<C-R>"}<Esc>kA
inoremap ;bb <Esc>"tciw\begin{<C-R>"}<CR>\end{<C-R>"}<Esc>kA

nnoremap ;f i\begin{figure}[]<CR>\centering<CR>\includegraphics[width=<++>\textwidth]{<++>}<CR>\caption{<++>}<CR>\label{fig:<++>}<CR>\end{figure}<CR><++><ESC>?\\begin<CR>:noh<CR>f[a
inoremap ;f \begin{figure}[]<CR>\centering<CR>\includegraphics[width=<++>\textwidth]{<++>}<CR>\caption{<++>}<CR>\label{fig:<++>}<CR>\end{figure}<CR><++><ESC>?\\begin<CR>:noh<CR>f[a

nnoremap ;b i@Book{,<CR>publisher = {<++>},<CR>isbn = {<++>},<CR>year = {<++>},<CR>title = {<++>},<CR>author = {<++>},<CR>}<ESC>%li
inoremap ;b @Book{,<CR>publisher = {<++>},<CR>isbn = {<++>},<CR>year = {<++>},<CR>title = {<++>},<CR>author = {<++>},<CR>}<ESC>%li

inoremap ;c \cref{}<left>

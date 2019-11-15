" https://github.com/amix/vimrc?fbclid=IwAR1ELUy4t5Y4SutbGC8wG2yFBnobYq5zXlkWOWLqKZK_P2sJljkv06OVJJo
" https://github.com/junegunn/vim-plug?fbclid=IwAR0p5Uh6fTn0yssagzTod7OpleJa-gJJ-_LAn6nOKDLfKK1tH5R0iVIRF3I


set runtimepath+=~/.vim_runtime
set t_Co=256

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rhysd/vim-clang-format'
Plug 'JuliaEditorSupport/julia-vim'

 " List ends here. Plugins become visible to Vim after this call.
call plug#end()

""" Useful remaps
inoremap jk   <esc>
" set Meta+j,k to Alt+j,k
execute "set <M-j>=\ej"
execute "set <M-k>=\ek"
nnoremap <M-j> :move .+1<CR>
nnoremap <M-k> :move .-2<CR>
inoremap <M-j> <Esc>:move .+1<CR>==gi
inoremap <M-k> <Esc>:move .-2<CR>==gi
vnoremap <M-j> :move '>+1<CR>gv=gv
vnoremap <M-k> :move '<-2<CR>gv=gv

syntax on
filetype plugin on
set tabstop=4
set number
set relativenumber
set clipboard=unnamedplus
set complete=.,w,b,u,t,i,kspell
set dictionary=/usr/share/dict/american-english
set splitbelow splitright

" Sets omnifunc to language-based completion, but only in the case of cpp-files (python files have good completion by 'default', it's probably a plug-in's fault)
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
          \	if &omnifunc == "ccomplete#Complete" |
          \		setlocal omnifunc=syntaxcomplete#Complete |
          \	endif
endif

autocmd BufNewFile *.sh norm i#!/bin/bash

""" Python commands
autocmd BufNewFile *.py :normal iimport numpy as np
autocmd BufNewFile *.py :normal o
autocmd FileType python :nnoremap <F5> :w<CR>:!clear;python3 %<CR>

set termguicolors
colorscheme gruvbox | hi Normal guibg=#000000

""" LaTeX commands
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_latexmk = {
            \ 'build_dir' : 'build',
            \}
let g:tex_conceal = ""

autocmd FileType tex setlocal spell spelllang=en_us | hi clear SpellBad | hi SpellBad cterm=underline ctermfg=red
autocmd FileType tex colorscheme badwolf
autocmd FileType tex inoremap <C-\> \(\)<Esc>hi
autocmd FileType tex inoremap `/ \frac{}{}<Esc>hhi


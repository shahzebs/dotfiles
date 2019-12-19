" https://github.com/junegunn/vim-plug?fbclid=IwAR0p5Uh6fTn0yssagzTod7OpleJa-gJJ-_LAn6nOKDLfKK1tH5R0iVIRF3I

set runtimepath+=~/.vim_runtime
set t_Co=256

source ~/.vim_runtime/vimrcs/init.vim
source ~/.vim_runtime/vimrcs/filetypes.vim

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rhysd/vim-clang-format'
Plug 'sainnhe/gruvbox-material'
Plug 'jiangmiao/auto-pairs'
Plug 'psliwka/vim-smoothie'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'vim-syntastic/syntastic'

 " List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']

" Polyglot config
let g:polyglot_disabled = ['latex']

""" Useful remaps
inoremap jk <esc>

" Jump to first <++>, delete it, and enter insert mode
nnoremap <space><space> /<++><CR>:noh<CR>"_cf>
" inoremap <space><space> <ESC>/<++><CR>:noh<CR>"_cf>

" Delete/change until first <++> (forward direction)
nnoremap d<Space> d/<++><CR>d4l:noh<CR>
nnoremap c<Space> d/<++><CR>d4l:noh<CR>i

" Simple surround commands
nnoremap "" "tciw"<C-R>""<ESC>
nnoremap '' "tciw'<C-R>"'<ESC>
nnoremap (( "tciw(<C-R>")<ESC>
nnoremap [[ "tciw[<C-R>"]<ESC>
nnoremap {{ "tciw{<C-R>"}<ESC>
vnoremap "" h"tc"<C-R>""<ESC>
vnoremap '' h"tc'<C-R>"'<ESC>
vnoremap (( h"tc(<C-R>")<ESC>
vnoremap [[ h"tc[<C-R>"]<ESC>
vnoremap {{ h"tc{<C-R>"}<ESC>

set scrolloff=10
set number relativenumber
set clipboard=unnamedplus
set complete=.,w,b,u,t,i,kspell
set dictionary=/usr/share/dict/american-english
set splitbelow splitright

if &term != 'st-256color'
    set termguicolors
endif

set background=dark
colorscheme gruvbox-material "| hi Normal guibg=#1f1f1f
let g:gruvbox_material_background = 'hard'
" let g:lightline = {'colorscheme' : 'gruvbox_material'}

" Changes working directory
set acd

" Recompile when writing a suckless program, e.g. dwm or st
let myfilepath = expand('%:p')
if myfilepath =~ "dwm\/" || myfilepath =~ "\/st\/"
    autocmd BufWritePost * :!make && sudo make install
endif

" After writing sxhkdrc, kill existing instance and launch new
autocmd BufWritePost sxhkdrc :!kill -9 $(pgrep sxhkd); sxhkd &

" After writing dwmbar file, kill all intances and run new
autocmd BufWritePost dwmbar :!killall dwmbar; setsid $HOME/.scripts/dwmbar &

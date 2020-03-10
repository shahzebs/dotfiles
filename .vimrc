" https://github.com/junegunn/vim-plug?fbclid=IwAR0p5Uh6fTn0yssagzTod7OpleJa-gJJ-_LAn6nOKDLfKK1tH5R0iVIRF3I

set runtimepath+=~/.vim/runtime
set t_Co=256

source ~/.vim/runtime/vimrcs/init.vim

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'lervag/vimtex'
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
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

" Auto-pairs config
let g:AutoPairsShortcutFastWrap = ''

""" Useful remaps
inoremap jk <esc>

" Jump to first <++>, delete it, and enter insert mode
nnoremap <silent> ;; /<++><CR>:noh<CR>"_cf>
inoremap <silent> ;; <ESC>/<++><CR>:noh<CR>"_cf>

" Delete/change until first <++> (forward direction)
nnoremap d<Space> d/<++><CR>d4l:noh<CR>
nnoremap c<Space> d/<++><CR>d4l:noh<CR>i

" Simple surround commands
nnoremap "" "tciw"<C-R>""<ESC>
nnoremap '' "tciw'<C-R>"'<ESC>
nnoremap (( "tciw(<C-R>")<ESC>
nnoremap [[ "tciw[<C-R>"]<ESC>
nnoremap {{ "tciw{<C-R>"}<ESC>
vnoremap "" "tc"<C-R>""<ESC>
vnoremap '' "tc'<C-R>"'<ESC>
vnoremap (( "tc(<C-R>")<ESC>
vnoremap [[ "tc[<C-R>"]<ESC>
vnoremap {{ "tc{<C-R>"}<ESC>

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
colorscheme gruvbox-material

" Make background transparent and the tildes visible
hi Normal ctermbg=none 
hi EndOfBuffer ctermbg=none ctermfg=243 
hi LineNr ctermbg=none 
hi FoldColumn ctermbg=none

" Set a visible Visual highlight bg color
hi Visual ctermbg=241

" Changes working directory
set acd

" Recompile when writing a suckless program, e.g. dwm or st
let myfilepath = expand('%:p')
if myfilepath =~ "\.suckless"
    autocmd BufWritePost *.c,*.h :!make && sudo make install
endif

" After writing sxhkdrc, kill existing instance and launch new
autocmd BufWritePost sxhkdrc :!killall sxhkd; setsid sxhkd &


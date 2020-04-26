" https://github.com/junegunn/vim-plug?fbclid=IwAR0p5Uh6fTn0yssagzTod7OpleJa-gJJ-_LAn6nOKDLfKK1tH5R0iVIRF3I

set runtimepath+=~/.vim/runtime
set t_Co=256

source ~/.vim/runtime/vimrcs/init.vim

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'lervag/vimtex'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rhysd/vim-clang-format'
Plug 'sainnhe/gruvbox-material'
Plug 'jiangmiao/auto-pairs'
Plug 'psliwka/vim-smoothie'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'unblevable/quick-scope'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Set colorscheme early
set background=dark
colorscheme gruvbox-material

" Polyglot config
let g:polyglot_disabled = ['latex']

" Auto-pairs config
let g:AutoPairsShortcutFastWrap = ''

" Quick-scope config
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
highlight QuickScopePrimary ctermfg=111
highlight QuickScopeSecondary ctermfg=112

""" Useful remaps
inoremap jk <esc>

" Jump to first <++>, delete it, and enter insert mode
nnoremap <silent> ;; /<++><CR>:noh<CR>"_cf>
inoremap <silent> ;; <ESC>/<++><CR>:noh<CR>"_cf>

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

" W and Q writes and quits like w and q
command! W execute 'w'
command! Q execute 'q'
command! Wq execute 'wq'
command! WQ execute 'wq'

set scrolloff=10
set number relativenumber
set clipboard=unnamedplus
set complete=.,w,b,u,t,i,kspell
set dictionary=/usr/share/dict/american-english
set splitbelow splitright

if &term != 'st-256color'
    set termguicolors
endif

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

" Run xrdb on Xresources on write
autocmd BufWritePost .Xresources :!xrdb %


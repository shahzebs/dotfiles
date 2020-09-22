" https://github.com/junegunn/vim-plug?fbclid=IwAR0p5Uh6fTn0yssagzTod7OpleJa-gJJ-_LAn6nOKDLfKK1tH5R0iVIRF3I

set runtimepath+=~/.config/nvim/runtime
set t_Co=256

source ~/.config/nvim/runtime/vimrcs/init.vim

" Polyglot config
let g:polyglot_disabled = ['latex']

call plug#begin('~/.config/nvim/plugged')

Plug 'lervag/vimtex'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rhysd/vim-clang-format'
Plug 'sainnhe/gruvbox-material'
Plug 'jiangmiao/auto-pairs'
Plug 'psliwka/vim-smoothie'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'unblevable/quick-scope'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'ap/vim-css-color'

call plug#end()

" Set colorscheme early
set background=dark
colorscheme gruvbox-material

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
vnoremap "" "tc"<C-R>""<ESC>
vnoremap '' "tc'<C-R>"'<ESC>
vnoremap (( "tc(<C-R>")<ESC>

" W and Q writes and quits like w and q
command! W execute 'w'
command! Q execute 'q'
command! Wq execute 'wq'
command! WQ execute 'wq'

set scrolloff=10
set number relativenumber
set clipboard=unnamedplus
set dictionary+=~/.config/nvim/dict/english-words.txt
set thesaurus+=~/.config/nvim/thesaurus/english.txt
set complete=.,w,b,u,t,i,k
set splitbelow splitright
let g:tex_flavor = "latex"

" Look for tags file in parent directories
set tags=tags;/

" Make background transparent and the tildes visible
hi Normal ctermbg=none
hi EndOfBuffer ctermbg=none ctermfg=243 
hi LineNr ctermbg=none
hi CursorLineNr ctermbg=none
hi FoldColumn ctermbg=none
hi SignColumn ctermbg=none

" Set a visible Visual highlight bg color
hi Visual ctermbg=241

" Changes working directory
set acd

" Recompile when writing a suckless program, e.g. dwm or st
if expand('%:p') =~ "\.suckless"
    autocmd BufWritePost *.c,*.h :!make && sudo make install
endif

" After writing sxhkdrc, kill existing instance and launch new
autocmd BufWritePost sxhkdrc :!killall sxhkd; setsid sxhkd &

" Run xrdb on Xresources on write
autocmd BufWritePost .Xresources :!xrdb %

" Source coc.nvim vimrc
source ~/.config/nvim/runtime/vimrcs/coc.vim

" Toggle coc.nvim on/off
let s:cocenabled = 1
function! ToggleCoc()
    if s:cocenabled
        CocDisable
        let s:cocenabled = 0
    else
        CocEnable
        let s:cocenabled = 1
    endif
endfunction
nnoremap <leader>c :call ToggleCoc()<CR>

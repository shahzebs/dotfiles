" https://github.com/junegunn/vim-plug?fbclid=IwAR0p5Uh6fTn0yssagzTod7OpleJa-gJJ-_LAn6nOKDLfKK1tH5R0iVIRF3I

set runtimepath+=~/.config/nvim/runtime
set t_Co=256

source ~/.config/nvim/runtime/vimrcs/init.vim

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
Plug 'preservim/nerdcommenter'

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

" Make background transparent and the tildes visible
hi Normal ctermbg=none
hi EndOfBuffer ctermbg=none ctermfg=243 
hi LineNr ctermbg=none
hi CursorLineNr ctermbg=none
hi FoldColumn ctermbg=none
hi SignColumn ctermbg=none

" Set a visible Visual highlight bg color
hi Visual ctermbg=241

" Recompile when writing a suckless program, e.g. dwm or st
if expand('%:p') =~ "\.suckless"
    autocmd BufWritePost *.c,*.h :!make && sudo make install
endif

" After writing sxhkdrc, kill existing instance and launch new
autocmd BufWritePost sxhkdrc :call jobstart('killall sxhkd; sxhkd', {'detach':1})

" Run xrdb on Xresources on write
autocmd BufWritePost .Xresources :!xrdb %

" Source coc.nvim vimrc
source ~/.config/nvim/runtime/vimrcs/coc.vim

" List of coc-extensions
let g:coc_global_extensions = ['coc-java', 'coc-sh', 'coc-snippets', 'coc-vimlsp', 'coc-actions', 'coc-pyright']

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

command! Jsonpretty execute '%!jq'

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"Disable CoC by default
autocmd VimEnter * silent! :CocDisable


" TODO:
" Extract into method (java)

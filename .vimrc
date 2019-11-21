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
Plug 'JuliaEditorSupport/julia-vim'
Plug 'sainnhe/gruvbox-material'
Plug 'jiangmiao/auto-pairs'
Plug 'psliwka/vim-smoothie'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'

 " List ends here. Plugins become visible to Vim after this call.
call plug#end()

""" Useful remaps
inoremap jk <esc>

set scrolloff=10
set number relativenumber
set clipboard=unnamedplus
set complete=.,w,b,u,t,i,kspell
set dictionary=/usr/share/dict/american-english
set splitbelow splitright
set termguicolors
colorscheme gruvbox-material "| hi Normal guibg=#1f1f1f
let g:gruvbox_material_background = 'hard'
let g:lightline = {'colorscheme' : 'gruvbox_material'}


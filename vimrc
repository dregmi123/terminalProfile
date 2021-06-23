set nocompatible              " required
filetype off                  " required
set number
syntax on
filetype indent on
set smartindent
set noswapfile
set hlsearch "highlight all result
set ignorecase "ignore case in search 
set incsearch "show search as u type

" remove key binding from command mode
" noremap <Up> <Nop>
" noremap <Down> <Nop>
" noremap <Left> <Nop>
" noremap <Right> <Nop>


" remove key binding from insert mode
" inoremap <Up> <Nop>
" inoremap <Down> <Nop>
" inoremap <Left> <Nop>
" inoremap <Right> <Nop>


 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'sjl/badwolf'
" Automatically show Vim's complete menu while typing.
Plugin 'ycm-core/YouCompleteMe'
Plugin 'thaerkh/vim-indentguides'
" nerd tree:show file structure in left sides of pan  :NERDTree
Plugin 'preservim/nerdtree'
Plugin 'vim-airline/vim-airline'
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
map <C-l> gt
map <C-h> gT
map <silent> <C-a> :NERDTree<CR>
inoremap jk <ESC>

colorscheme badwolf
let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '|'
let g:ycm_autoclose_preview_window_after_completion = 1
" show buffers in status line when tabs open
let g:airline#extensions#tabline#enabled = 1

" set color for cursorline
set cursorline
hi CursorLine ctermbg=blue ctermfg=yellow

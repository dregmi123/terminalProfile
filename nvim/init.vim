colo desert
set termguicolors
set cursorline

" highlight different part of the buffer
augroup highlight
  autocmd!
  hi Normal guifg=#c3a129
  hi StatusLine guibg=orange guifg=black
  hi Function cterm=bold guifg=#1594A2
  hi String cterm=bold guifg=#038b62
  hi Comment cterm=bold guifg=#0080fe guibg=white
  hi CursorLine cterm=bold ctermbg=White ctermfg=Blue
  hi Comment cterm=bold,underline ctermfg=cyan
  hi Define guifg=red guibg=white
  hi Function guifg=#bf00ff
  hi CursorLine guibg=black
  "hi NonText guibg=red
  hi Include guifg=#ad1c74
  hi Statement guibg=green
augroup END

let mapleader=","
let maplocalleader="\<Tab>"
set number
syntax
set expandtab
set autoindent
set softtabstop=4
set shiftwidth=2
set tabstop=4

"filetype
"map jk to esc
inoremap jk <esc>
 
"Fix cursor replacement after closing nvim
set guicursor=
"Shift + Tab does inverse tab
inoremap <S-Tab> <C-d>
" pressing a character create another and put the cursor inside
augroup character_create
  autocmd!
  inoremap ' ''<esc>i
  inoremap " ""<esc>i
  inoremap ( ()<esc>i
  inoremap [ []<esc>i
  "inoremap { {}<esc>i
augroup END

"delete line in insert mode
inoremap <leader>d <esc>ddi
"See invisible characters
"set list listchars=tab:>\ ,trail:+,eol:$

"wrap to next line when end of line is reached
set whichwrap+=<,>,[,]
inoremap <c-d> <esc>ddi
nnoremap <leader>d dd

"edit and source vimrc
augroup edit_source
  autocmd!
  nnoremap <leader>ev :vsplit $MYVIMRC<cr>
  nnoremap <leader>sv :source $MYVIMRC<cr>
augroup END

":mkview and loadview to save and load view
augroup save_and_load_fold
  autocmd!
  nnoremap <leader>sf :mkview<cr>
  nnoremap <leader>lf :loadview<cr>
augroup END

"movement in insert mode
augroup insert_mode_movement
  autocmd!
  inoremap <c-h> <left>
  inoremap <c-l> <right>
  inoremap <c-j> <down>
  inoremap <c-k> <up>
augroup END
"usually put them at last
"unmap some keys
augroup unbind_keys
  autocmd!
  inoremap <esc> <nop>
  inoremap <left> <nop>
  inoremap <right> <nop>
  inoremap <up> <nop>
  inoremap <down> <nop>
augroup END

"unbind in normal mode
augroup normal_mode_unbind
  autocmd!
  nnoremap <left> <nop>
  nnoremap <right> <nop>
  nnoremap <up> <nop>
  nnoremap <down> <nop>
augroup END

" plugin start from here
call plug#begin('~/.vim/plugged')
Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/vim-lsc'
"Plug 'natebosch/vim-lsc-dart'

call plug#end()
" plug ends here

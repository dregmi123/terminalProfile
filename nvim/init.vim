set pyxversion=3
set fileformat=unix
augroup frontend_management
  autocmd!
  set relativenumber
  syntax on
  set termguicolors
  set cursorline
  hi Normal guifg=#69784d
  hi CursorLine cterm=bold  guibg=#9ec0c0 guifg=#4e4642
  hi Pmenu guibg=black guifg=white
  hi Folded guibg= #7d4e5e guifg=#24222e
  hi PmenuThumb guibg=green
  hi PmenuSel ctermfg=242 guibg=green
augroup END

let mapleader=","
let maplocalleader="\/"
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

"wrap to next line when end of line is reached
set whichwrap+=<,>,[,]
inoremap <c-d> <esc>ddi
nnoremap <leader>d dd

"edit and source vimrc
augroup edit_source
  autocmd!
  nnoremap <leader>ev :tabedit $MYVIMRC<cr>
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
  "autocmd!
  inoremap <c-h> <left>
  inoremap <c-l> <right>
  inoremap <c-j> <down>
  inoremap <c-k> <up>
augroup END
"
"unmap some keys
augroup unbind_keys
  autocmd!
  inoremap <esc> <nop>
  inoremap <left> <nop>
  inoremap <right> <nop>
  inoremap <up> <nop>
  inoremap <down> <nop>
  nnoremap <left> <nop>
  nnoremap <right> <nop>
  nnoremap <up> <nop>
  nnoremap <down> <nop>
augroup END


" plugin start from here
call plug#begin('~/.vim/plugged')
  " status line 
  Plug 'vim-airline/vim-airline'

  " global plugin
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'rafi/awesome-vim-colorschemes'
  
  " snippets
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/vim-vsnip-integ'

  " dart and flutter
  Plug 'dart-lang/dart-vim-plugin'
  Plug 'Neevash/awesome-flutter-snippets'
  
  " javascript
  Plug 'maxmellon/vim-jsx-pretty'

  " python
  "Plug 'jmcantrell/vim-virtualenv'

  " hardcore mode
  Plug 'wikitopian/hardmode'

call plug#end()
" plug ends here

"popmenu select with h,j,k,l
inoremap <c-j> <c-n>
inoremap <c-k> <c-p>

" NOTE: You can use other key to expand snippet.


" coc-flutter
nnoremap <leader>a  <Plug>(coc-codeaction-selected)

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
"augroup normal_snippet
  "autocmd!
  "let g:UltiSnipsExpandTrigger="ep"
  "let g:UltiSnipsJumpForwardTrigger="np"
  "let g:UltiSnipsJumpBackwardTrigger="pp"
"augroup END

"need following setting for flutter
augroup flutter_snippet
  autocmd!
  imap <expr> /e   vsnip#available(1)  ? '<Plug>(vsnip-expand)'         : '<C-j>'
  imap <expr> /n   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
  imap <expr> /p   vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
augroup END


let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 1

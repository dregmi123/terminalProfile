colorscheme industry
set pyxversion=3
" set fileformat=unix
augroup frontend_management
  autocmd!
  set relativenumber
  filetype indent on
  syntax on
  set termguicolors
  set cursorline
  "hi CursorLine cterm=bold  guibg=#9ec0c0 guifg=#4e4642
  hi Pmenu guibg=black guifg=white
  hi Normal guibg=NONE ctermbg=NONE
  "hi Folded guibg= #7d4e5e guifg=#24222e
  hi PmenuThumb guibg=green
  hi Number guibg=red
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


"generate skeleton
augroup skeletons
  au!
  autocmd BufNewFile *.* silent! execute '0r ~/.vim/templates/skeleton.'.expand("<afile>:e")
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
  "inoremap <esc> <nop>
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

  " global plugin
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  Plug 'larsbs/vimterial_dark'

  " javascript
  Plug 'maxmellon/vim-jsx-pretty'

  "flutter and dart
  Plug 'dart-lang/dart-vim-plugin'

  " hardcore mode
  Plug 'wikitopian/hardmode'

  "Python
  Plug 'davidhalter/jedi-vim'
  Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
  Plug 'python/black'

  Plug 'kyazdani42/nvim-web-devicons' " for file icons
  Plug 'kyazdani42/nvim-tree.lua'

  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

  Plug 'felixfbecker/php-language-server', {'do': 'composer install && composer run-script parse-stubs'}


call plug#end()
" plug ends here

"popmenu select with h,j,k,l
inoremap <c-j> <c-n>
inoremap <c-k> <c-p>

" expand snipets with ctrl p
inoremap <tab>e <c-y>


xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

"snipets trigger coc-snipets

" Use tab l for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<Tab>l'

" Use tab h for jump to previous p
let g:coc_snippet_prev = '<Tab>h'

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)



" coc-flutter-tools format on save
let g:dart_format_on_save = 1

let g:jedi#completions_enabled = 0

let g:nvim_tree_side = 'right' "left by default
let g:nvim_tree_width = 40 "30 by default, can be width_in_columns or 'width_in_percent%'
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
let g:nvim_tree_gitignore = 1 "0 by default
let g:nvim_tree_auto_open = 1 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
let g:nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard' ] "empty by default, don't auto open tree on specific filetypes.
let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_hide_dotfiles = 1 "0 by default, this option hides files and folders starting with a dot `.`
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_tab_open = 1 "0 by default, will open the tree when entering a new tab and the tree was previously open
let g:nvim_tree_auto_resize = 0 "1 by default, will resize the tree to its saved width when opening a file
let g:nvim_tree_disable_netrw = 0 "1 by default, disables netrw
let g:nvim_tree_hijack_netrw = 0 "1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_lsp_diagnostics = 1 "0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
let g:nvim_tree_disable_window_picker = 1 "0 by default, will disable the window picker.
let g:nvim_tree_hijack_cursor = 0 "1 by default, when moving cursor in the tree, will position the cursor at the start of the file on the current line
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
let g:nvim_tree_update_cwd = 1 "0 by default, will update the tree cwd when changing nvim's directory (DirChanged event). Behaves strangely with autochdir set.
let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
let g:nvim_tree_window_picker_exclude = {
	\   'filetype': [
	\     'packer',
	\     'qf'
	\   ],
	\   'buftype': [
	\     'terminal'
	\   ]
	\ }
" Dictionary of buffer option names mapped to a list of option values that
" indicates to the window picker that the buffer's window should not be
" selectable.
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
	\ 'git': 1,
	\ 'folders': 0,
	\ 'files': 0,
	\ 'folder_arrows': 0,
	\ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set indent_markers (because of UI conflict)

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
	\ 'git': {
	\   'unstaged': "✗",
	\   'staged': "✓",
	\   'renamed': "➜",
	\   'untracked': "★",
	\   'ignored': "◌"
	\   },
	\ 'folder': {
	\   'empty': "",
	\   'empty_open': "",
	\   },
	\   'lsp': {
	\     'hint': "",
	\     'info': "",
	\     'warning': "",
	\     'error': "",
	\   }
	\ }

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" NvimTreeOpen, NvimTreeClose and NvimTreeFocus are also available if you need them

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue'


hi semshiLocal           ctermfg=209 guifg=#ff875f
hi semshiGlobal          ctermfg=214 guifg=#ffaf00
hi semshiImported        ctermfg=214 guifg=#ffaf00 cterm=bold gui=bold
hi semshiParameter       ctermfg=75  guifg=#5fafff
hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
hi semshiFree            ctermfg=218 guifg=#ffafd7
hi semshiBuiltin         ctermfg=207 guifg=#ff5fff
hi semshiAttribute       ctermfg=49  guifg=#00ffaf
hi semshiSelf            ctermfg=249 guifg=#b2b2b2
hi semshiUnresolved      ctermfg=226 guifg=#ffff00 cterm=underline gui=underline
hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d7005f

hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
hi semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
sign define semshiError text=E> texthl=semshiErrorSign


"autocmd BufWritePre *.py execute ':Black'
let g:black_linelength = 79  " default is 88

"intelephense.diagnostics.undefinedSymbols": false

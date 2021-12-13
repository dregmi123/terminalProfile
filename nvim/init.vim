" augroup for unmanagable stuff
augroup unmanagable_stuff
	autocmd!
	au FileType python setlocal formatprg=autopep8\ -
	let g:python_highlight_all = 1
	set pyxversion=3
	set clipboard=unnamed
	filetype plugin on
	set completeopt=menuone,noselect
	" set fileformat=unix
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

	let mapleader=","
	let maplocalleader="\/"
	set autoindent

	"filetype

	"Fix cursor replacement after closing nvim
	set guicursor=
	"Shift + Tab does inverse tab
	inoremap <S-Tab> <C-d>
augroup END

augroup character_create
	autocmd!
	inoremap ' ''<esc>i
	inoremap " ""<esc>i
	inoremap ( ()<esc>i
	inoremap [ []<esc>i
	"inoremap { {}<esc>i
augroup END

"edit and source vimrc
augroup edit_source
	autocmd!
	nnoremap <leader>ev :tabedit $MYVIMRC<cr>
	nnoremap <leader>sv :source $MYVIMRC<cr>
augroup END
"movement in insert mode
augroup insert_mode_movement
	"autocmd!
	inoremap <c-h> <left>
	inoremap <c-l> <right>
	inoremap <c-j> <down>
	inoremap <c-k> <up>
	"popmenu select with h,j,k,l
	inoremap <c-j> <c-n>
	inoremap <c-k> <c-p>
augroup END
"
"unmap some keys
augroup unbind_keys
	autocmd!
	"map jk to esc
	inoremap jk <esc>
	tnoremap <c-\> <c-\><c-n>
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

call plug#begin('~/.vim/plugged')
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'akinsho/toggleterm.nvim'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdcommenter'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

augroup nvim_scope
	autocmd!
	" nvim compe---
	let g:compe = {}
	let g:compe.enabled = v:true
	let g:compe.autocomplete = v:true
	let g:compe.debug = v:false
	let g:compe.min_length = 1
	let g:compe.preselect = 'enable'
	let g:compe.throttle_time = 80
	let g:compe.source_timeout = 200
	let g:compe.resolve_timeout = 800
	let g:compe.incomplete_delay = 400
	let g:compe.max_abbr_width = 100
	let g:compe.max_kind_width = 100
	let g:compe.max_menu_width = 100
	let g:compe.documentation = v:true

	let g:compe.source = {}
	let g:compe.source.path = v:true
	let g:compe.source.buffer = v:true
	let g:compe.source.calc = v:true
	let g:compe.source.nvim_lsp = v:true
	let g:compe.source.nvim_lua = v:true
	let g:compe.source.vsnip = v:true
	let g:compe.source.ultisnips = v:true
	let g:compe.source.luasnip = v:true
	let g:compe.source.emoji = v:true
augroup END

augroup toggle_term
	autocmd!
	" set
	let g:toggleterm_terminal_mapping = '<C-t>'
	" or manually...
	autocmd TermEnter term://*toggleterm#*
	      \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
	" By applying the mappings this way you can pass a count to your
	" mapping to open a specific window.
	" For example: 2<C-t> will open terminal 2
	nnoremap <silent>tt <Cmd>exe v:count1 . "ToggleTerm"<CR>
	inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
augroup END

augroup nerd_tree
	autocmd!

	" Create default mappings
	let g:NERDCreateDefaultMappings = 1

	" Add spaces after comment delimiters by default
	let g:NERDSpaceDelims = 1

	" Use compact syntax for prettified multi-line comments
	let g:NERDCompactSexyComs = 1

	" Align line-wise comment delimiters flush left instead of following code indentation
	let g:NERDDefaultAlign = 'left'

	" Set a language to use its alternate delimiters by default
	let g:NERDAltDelims_java = 1

	" Add your own custom formats or override the defaults
	let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

	" Allow commenting and inverting empty lines (useful when commenting a region)
	let g:NERDCommentEmptyLines = 1

	" Enable trimming of trailing whitespace when uncommenting
	let g:NERDTrimTrailingWhitespace = 1

	" Enable NERDCommenterToggle to check all selected lines is commented or not 
	let g:NERDToggleCheckAllLines = 1

	" for auto pep8
	nnoremap <leader>pp ::PymodeLintAuto<cr>
augroup END



augroup telescope
	autocmd!
	nnoremap <leader>ff <cmd>Telescope find_files<cr>
	nnoremap <leader>gg <cmd>Telescope live_grep<cr>
	nnoremap <leader>fb <cmd>Telescope buffers<cr>
	nnoremap <leader>fh <cmd>Telescope help_tags<cr>
	nnoremap <leader>fg <cmd>Telescope git_files<cr>
augroup END


" python pep8 format
nnoremap <leader>pp <cmd>PymodeLintAuto<cr>
augroup python_syntax
	autocmd!
	hi semshiLocal           ctermfg=209 guifg=#ff875f
	hi semshiGlobal          ctermfg=214 guifg=#ffaf00
	hi semshiImported        ctermfg=214 guifg=#ffaf00 cterm=bold gui=bold
	hi semshiParameter       ctermfg=75  guifg=#5fafff
	hi semshiParameterUnused ctermfg=red guifg=red cterm=underline gui=underline
	hi semshiFree            ctermfg=218 guifg=#ffafd7
	hi semshiBuiltin         ctermfg=207 guifg=#ff5fff
	hi semshiAttribute       ctermfg=49  guifg=#00ffaf
	hi semshiSelf            ctermfg=249 guifg=#b2b2b2
	hi semshiUnresolved      ctermfg=226 guifg=#ffff00 cterm=underline gui=underline
	hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d7005f
	hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
	hi semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
	sign define semshiError text=E> texthl=semshiErrorSign

	nmap <silent> <leader>rr :Semshi rename<CR>
	nmap <silent> <Tab> :Semshi goto name next<CR>
	nmap <silent> <S-Tab> :Semshi goto name prev<CR>
	nmap <silent> <leader>c :Semshi goto class next<CR>
	nmap <silent> <leader>C :Semshi goto class prev<CR>
	nmap <silent> <leader>f :Semshi goto function next<CR>
	nmap <silent> <leader>F :Semshi goto function prev<CR>
	nmap <silent> <leader>gu :Semshi goto unresolved first<CR>
	nmap <silent> <leader>gp :Semshi goto parameterUnused first<CR>
	nmap <silent> <leader>ee :Semshi error<CR>
	nmap <silent> <leader>ge :Semshi goto error<CR>
augroup END

let g:python3_host_prog = '/usr/bin/python'
colorscheme torte
" augroup for unmanagable stuff
augroup unmanagable_stuff
        autocmd!
        " au FileType python setlocal formatprg=autopep8\ -
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
        " hi Pmenu guibg=black guifg=white
        " hi Normal guibg=NONE ctermbg=NONE
        "hi Folded guibg= #7d4e5e guifg=#24222e
        " hi PmenuThumb guibg=green
        " hi Number guibg=red
        " hi PmenuSel ctermfg=242 guibg=green

        let mapleader=","
        let maplocalleader="\/"
        set autoindent

        "filetype

        "Fix cursor replacement after closing nvim
        " set guicursor=
        "Shift + Tab does inverse tab
        inoremap <S-Tab> <C-d>
augroup END

augroup character_create
        autocmd!
        inoremap ' ''<esc>i
        inoremap " ""<esc>i
        inoremap ( ()<esc>i
        inoremap [ []<esc>i
        "popmenu select with h,j,k,l
        inoremap <c-j> <c-n>
        inoremap <c-k> <c-p>
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
" Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
Plug 'akinsho/toggleterm.nvim' " Responsible for showing terminal
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive' " Git wrapper
Plug 'vim-syntastic/syntastic' " Syntax Checker
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
call plug#end()

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
        nnoremap <leader>pp :PymodeLintAuto<cr>
augroup END



augroup telescope
        autocmd!
        nnoremap <leader>ff <cmd>Telescope find_files<cr>
        nnoremap <leader>gg <cmd>Telescope live_grep<cr>
        nnoremap <leader>fb <cmd>Telescope buffers<cr>
        nnoremap <leader>fh <cmd>Telescope help_tags<cr>
        nnoremap <leader>fg <cmd>Telescope git_files<cr>
augroup END

augroup syntastic
        autocmd!
        let g:syntastic_python_checkers = ['prospector', 'flake8']
        set statusline+=%#warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=%*
        let g:syntastic_always_populate_loc_list = 1
        " let g:syntastic_auto_loc_list = 1
        let g:syntastic_check_on_open = 1
        let g:syntastic_aggregate_errors = 1
        let g:syntastic_check_on_wq = 0
        let g:syntastic_enable_balloons = 1
        let g:syntastic_enable_highlighting = 1
augroup END

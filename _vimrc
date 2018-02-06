" automatic reloading .vimrc
autocmd! bufwritepost .vimrc source %

" set guioptions-=m
nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
set guioptions-=T
set guioptions-=r
set guioptions-=L

set cursorline cul
set nocompatible
filetype off


"        Command                            Description
"
" PlugInstall [name ...] [#threads] 	Install plugins
" PlugUpdate [name ...] [#threads] 	Install or update plugins
" PlugClean[!] 	                        Remove unused directories
" PlugUpgrade 	                        Upgrade vim-plug itself
" PlugStatus 	                        Check the status of plugins
" PlugDiff 	                        Examine changes from the previous update and the pending changes
" PlugSnapshot[!] [output path] 	Generate script for restoring the current snapshot of the plugins

call plug#begin('~/.vim/plugged')

"------------------=== code/project navigation ===------------------
Plug 'Raimondi/delimitMate'
Plug 'godlygeek/tabular'                       " <leader> a
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'                       " class/module browser
Plug 'mbbill/undotree'
Plug 'nathanaelkane/vim-indent-guides'         " visual indentation
Plug 'scrooloose/nerdtree'                     " project and file navigation
Plug 'terryma/vim-multiple-cursors'            " sublimelike multiple cursors
Plug 'tmhedberg/SimpylFold', {'for': 'python'}
Plug 'tpope/vim-surround'                      " usage: cs, ds,ys, S
Plug 'heavenshell/vim-pydocstring'             " gpd
Plug 'jmcantrell/vim-virtualenv'               " virtualenv support
Plug 'jlanzarotta/bufexplorer'                 " be, bt, bs, bv

"------------------=== code/project navigation ===------------------
Plug 'Lokaltog/powerline'              " powerline fonts plugin
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fisadev/FixedTaskList.vim'       " pending tast list
Plug 'rosenfeld/conque-term'           " consoles as buffers
Plug 'michaeljsmith/vim-indent-object' " <count> ai, aI, li, lI
Plug 'scrooloose/nerdcommenter'

Plug 'tmhedberg/SimpylFold', {'for': 'python'}
Plug 'Valloric/YouCompleteMe', {'dir': '~/.vim/plugged/YouComleteMe', 'do': 'python2 install.py'}
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'idanarye/vim-merginal'
Plug 'vim-scripts/indentpython.vim', {'for': 'python'}
Plug 'vim-syntastic/syntastic'
Plug 'jreybert/vimagit'

Plug 'jpo/vim-railscasts-theme'
Plug 'altercation/vim-colors-solarized'

call plug#end()

set encoding=utf-8
set fileencoding=utf-8

" enable syntax highlighting

filetype on
filetype plugin on
filetype indent on
syntax enable

" disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

" search and substitution options
set hlsearch   " highlight all the results of a particular search
set incsearch  " start searching immediately (incremental search)
set ignorecase " not case sensitive search
set smartcase  " if in your search's request would Uppercase will search only it
set gdefault   " global flag default for substitute command

" mouse and backspace options
set mouse=a
set backspace=indent,eol,start " make backspace behave like normal again

" whitespaces instead of TABs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" showing line numbers and length
set number " show lin numbers
set tw=79  " width of document (used by gd)
set nowrap " don't automatically wrap on load
set fo-=t  " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" split windows options
set winwidth=86
set winheight=5
set winminheight=5
set winheight=999
set visualbell      " flash the screen instead of beeping
set cursorline      " highlight a line where cursor is

" better copy & paste
" before copy large block of text press F2, at the bottom should appeared
set pastetoggle=<F2>
set clipboard=unnamedplus
" paste multiple times
xnoremap p pgvy

"add new line by enter
map <Enter> o<ESC>
map <S-Enter> O<ESC>

" mouse and backspace
set mouse=a
set bs=2

" rebind <leader> key
let mapleader=","

" quicksave command
noremap <c-z> :update<cr>
vnoremap <c-z> <c-c> :update<cr>
inoremap <c-z> <c-o> :update<cr>

" bind nohl
" noremap  <c-n> :nohl<cr>
" vnoremap <c-n> :nohl<cr>
" inoremap <c-n> :nohl<cr>

" quick quit command
noremap <leader>e :quit<cr>
noremap <leader>E :qa!<cr>

" easier movement between splitted windows
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

" easier moving between tabs
noremap <leader>n <esc> :tabprevious<cr>
noremap <leader>m <esc> :tabnext<cr>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

"python with virtualenv support
py3 << EOF
import os
import sys
import vim

if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
#  sys.path.insert(0, project_base_dir)
#  activate_this = os.path.join(project_base_dir, 'Scripts/activate_this.py')
#  execfile(activate_this, dict(__file__=activate_this))
  python_binary_path = os.path.join(project_base_dir, 'bin/python').replace('\\', '/')
  vim.command('let g:ycm_python_binary_path = "{}"'.format(python_binary_path))
  #  vim.command('let g:syntastic_python_pylint_exe="python"')
EOF

"==========================================
""             ctrlp settings            ""
"==========================================
let g:ctrlp_max_height=30
set wildignore+=*.pyc
set wildignore+=*._build/*
set wildignore+=*/coverage/*


"==========================================
""            folding options            ""
"==========================================
let g:SimpylFold_docstring_preview = 1
set nofoldenable
set foldmethod=manual


"==========================================
""        vim-indent-guides              ""
"==========================================
let g:indent_guides_enable_on_vim_startup = 0


"==========================================
""         set colorscheme               ""
"==========================================
" show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

let g:solarized_termcolors=256
set background=dark
colorscheme solarized

highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual


"==========================================
""           airline settings            ""
"==========================================
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#csv#enabled = 1

let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep= ''
let g:airline_left_sep = ''
" let g:airline#extensions#tabline#left_sep = '>>'
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = ' | '
" let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_powerline_fonts=1

set selection=inclusive

" nerdtree bindings
noremap go :NERDTreeToggle<cr>

" tagbar bindings
noremap gt :TagbarToggle<cr>


"==========================================
""              undo tree                ""
"==========================================
nnoremap gu :UndotreeToggle<cr> 


"==========================================
""               tabular                 ""
"==========================================
if exists(":Tabularize")
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a; :Tabularize /:\zs<CR>
    vmap <Leader>a; :Tabularize /:\zs<CR>
    nmap <Leader>a: :Tabularize /:<CR>
    vmap <Leader>a: :Tabularize /:<CR>
    nmap <Leader>a, :Tabularize /,\zs<CR>
    vmap <Leader>a, :Tabularize /,\zs<CR>
    nmap <Leader>a" :Tabularize /"<CR>
    vmap <Leader>a" :Tabularize /"<CR>
endif

"==========================================
""       conque-term settings            ""
"==========================================
let g:ConqueTerm_PyVersion=3
let g:ConqueTerm_Color=1
let g:ConqueTerm_StartMessages=0
noremap gv :ConqueTermVSplit bash<cr>
noremap gs :ConqueTermSplit bash<cr>

"==========================================
""               YCM settings            ""
"==========================================
" MUST to set noshowmode for jedy-vim show signature
set noshowmode

" YCM {
" Navigating through the list of suggestion with ctrl+j and ctrl+k
" let g:ycm_show_diagnostics_ui = 1
" let g:ycm_always_populate_location_list = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_use_ultisnips_completer = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_getdoc_buffer_command = 'vertical-split'
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
nnoremap <leader>d :YcmCompleter GoTo<CR>
map <S-k> :YcmCompleter GetDoc<CR>
" }

" " jedi-vim {P>
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 1
let g:jedi#smart_auto_mappings = 1
let g:jedi#popup_on_dot = 0
" " let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = 1
let g:jedi#show_call_signatures_delay = 0
" " redefined default configs just to be able see it when i forget something
" let g:jedi#goto_assignments_command = "<leader>g"
" let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#rename_command = "<leader>r"
" let g:jedi#usages_command = "<leader>u"
" call jedi#configure_call_signatures()
" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>


"==========================================
""               syntastic               ""
"==========================================

" noremap <c-[> :lp<cr>
" noremap <c-]> :lne<cr>
"
" " syntastic
" "" Recommended settings
"
" set statusline+=%{fugitive#statusline()} 
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}P4
" set statusline+=%*
"
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
"
silent! command Et SyntasticToggleMode
silent! command Ef SyntasticCheck
"
"
" "" I use the brew to install flake8
" let g:syntastic_python_checkers=['flake8']


"==========================================
""               merginal                ""
"==========================================
nnoremap gm :Merginal<cr>

"==========================================
""             pydocstring               ""
"==========================================
nmap <silent> gpd <Plug>(pydocstring)


"==========================================
""             nerdcomment               ""
"==========================================
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '"""','right': '"""' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

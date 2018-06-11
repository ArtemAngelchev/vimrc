" automatic reloading .vimrc
autocmd! bufwritepost .vimrc source %

set history=500
set cursorline cul
set nocompatible
filetype off

"        Command                            Description
"
" PlugInstall [name ...] [#threads] Install plugins
" PlugUpdate [name ...] [#threads]  Install or update plugins
" PlugClean[!]                      Remove unused directories
" PlugUpgrade                       Upgrade vim-plug itself
" PlugStatus                        Check the status of plugins
" PlugDiff                          Examine changes from the previous update and the pending changes
" PlugSnapshot[!] [output path]     Generate script for restoring the current snapshot of the plugins

call plug#begin('~/.vim/plugged')

"------------------=== code/project navigation ===------------------
Plug 'mbbill/undotree'                         " gu
Plug 'majutsushi/tagbar'                       " gt
Plug 'scrooloose/nerdtree'                     " go
Plug 'easymotion/vim-easymotion'
Plug 'jlanzarotta/bufexplorer'                 " be, bt, bs, bv
Plug 'fisadev/FixedTaskList.vim'               "

"------------------===        formating        ===------------------
Plug 'Raimondi/delimitMate'
Plug 'godlygeek/tabular'                       " <leader> a =|:|;|,|etc
Plug 'terryma/vim-multiple-cursors'            " sublimelike multiple cursors
Plug 'tpope/vim-surround'                      " usage: cs, ds,ys, S
Plug 'scrooloose/nerdcommenter'
Plug 'michaeljsmith/vim-indent-object'         " <count> ai, aI, li, lI

"------------------===          python         ===------------------
Plug 'w0rp/ale'
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'heavenshell/vim-pydocstring'             " gpd
Plug 'tmhedberg/SimpylFold', {'for': 'python'}
Plug 'vim-scripts/indentpython.vim', {'for': 'python'}
Plug 'jmcantrell/vim-virtualenv'               " virtualenv support
Plug 'rosenfeld/conque-term'                   " consoles as buffers

"------------------===           git           ===------------------
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'idanarye/vim-merginal'
Plug 'jreybert/vimagit'

Plug 'rafi/awesome-vim-colorschemes'
Plug 'Lokaltog/powerline'              " powerline fonts plugin
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jpo/vim-railscasts-theme'
Plug 'altercation/vim-colors-solarized'
call plug#end()

set encoding=utf-8
set fileencoding=utf-8

"******************************************
""     disable backup and swap files     ""
"******************************************
set nobackup
set nowritebackup
set noswapfile

"******************************************
""       enable syntax highlighting      ""
"******************************************
filetype on
filetype plugin on
filetype indent on
syntax enable
set wildmenu

" search and substitution options
set hlsearch   " highlight all the results of a particular search
set incsearch  " start searching immediately (incremental search)
set ignorecase " not case sensitive search
set smartcase  " if in your search's request would Uppercase will search only it
set gdefault   " global flag default for substitute command

" mouse and backspace options
set mouse=a
set backspace=indent,eol,start " make backspace behave like normal again

"******************************************
""      whitespaces instead of TABs      ""
"******************************************
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

"******************************************
""       line numbers and length         ""
"******************************************
set number " show line numbers
set tw=79  " width of document (used by gd)
set nowrap " don't automatically wrap on load
set fo-=t  " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

"******************************************
""        split windows options          ""
"******************************************
set winwidth=87
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

"******************************************
""       add new line with enter         ""
"******************************************
map <Enter> o<ESC>

"******************************************
""         rebind <leader> key           ""
"******************************************
let mapleader=","

"******************************************
""         quick exit and save           ""
"******************************************
noremap <leader>e :q<CR>
noremap <leader>E :qa!<CR>

noremap <C-Z> :update<CR>
vnoremap <C-Z> <Esc>:update<CR>gv
inoremap <C-Z> <Esc> :update<CR>i

"******************************************
""        easy split navigations         ""
"******************************************
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <c-l> <c-w><C-L>
noremap <C-H> <C-W><C-H>

"******************************************
""         easy tab navigations          ""
"******************************************
noremap <leader>n <esc> :tabprevious<cr>
noremap <leader>m <esc> :tabnext<cr>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

" map sort function to a key
vnoremap <Leader>s :sort<CR>

"******************************************
""    easier formatting of paragraphs    ""
"******************************************
vnoremap Q gq
noremap Q gq

"******************************************
""            folding options            ""
"******************************************
set nofoldenable
set foldmethod=manual
set foldlevel=99

"==========================================
""         Raimondi/delimitMate          ""
"==========================================
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_inside_quotes = 1
let g:delimitMate_expand_cr = 2
let g:delimitMate_nesting_quotes = ['"','`']

"==========================================
""            mbbill/undotree            ""
"==========================================
nnoremap gu :UndotreeToggle<cr> 
let g:undotree_CustomUndotreeCmd = 'vertical 32 new'
let g:undotree_CustomDiffpanelCmd = 'belowright 12 new'
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
try
    set undodir=~/.vim/.undodir/
    set undofile
catch
endtry

"==========================================
""           godlygeek/tabular           ""
"==========================================
noremap <Leader>a= :Tabularize /=<CR>
vnoremap <Leader>a= :Tabularize /=<CR>
noremap <Leader>a; :Tabularize /:\zs<CR>
vnoremap <Leader>a; :Tabularize /:\zs<CR>
noremap <Leader>a: :Tabularize /:<CR>
vnoremap <Leader>a: :Tabularize /:<CR>
noremap <Leader>a, :Tabularize /,\zs<CR>
vnoremap <Leader>a, :Tabularize /,\zs<CR>
noremap <Leader>a" :Tabularize /"<CR>
vnoremap <Leader>a" :Tabularize /"<CR>

"==========================================
""           majutsushi/tagbar           ""
"==========================================
let g:tagbar_autopreview = 1
let g:tagbar_autoclose = 1
let g:tagbar_show_linenumbers = 0
noremap gt :TagbarToggle<CR>

"==========================================
""          scrooloose/nerdtree          ""
"==========================================
noremap go :NERDTreeToggle<cr>

"==========================================
""          davidhalter/jedi-vim         ""
"==========================================
let g:jedi#popup_select_first = 1
let g:jedi#show_call_signatures = 1
let g:jedi#smart_auto_mappings = 1
let g:jedi#show_call_signatures_delay = 100
let g:jedi#usages_command = "<leader>u"
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "<C-k>"

"==========================================
""               w0rp/ale                ""
"==========================================
let g:ale_linters = {'python': ['flake8', 'pylint']}
let g:ale_python_pylint_options = '--disable=missing-docstring'
let g:ale_fixers = {'python': ['isort']}
noremap <leader>i :ALEFix isort<CR>
let g:ale_change_sign_column_color = 1
let g:ale_echo_msg_format = '%severity%|%linter%|%code%: %s'
let g:ale_sign_error = '>'
let g:ale_sign_warning = '!'
let g:ale_sign_column_always = 1

"==========================================
""         set colorscheme               ""
"==========================================
" show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/
"
colorscheme deus

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
let g:airline_powerline_fonts=1

set selection=inclusive

"==========================================
""       conque-term settings            ""
"==========================================
let g:ConqueTerm_PyVersion=3
let g:ConqueTerm_Color=1
let g:ConqueTerm_StartMessages=0
noremap gv :ConqueTermVSplit bash<cr>
noremap gs :ConqueTermSplit bash<cr>

"==========================================
""               merginal                ""
"==========================================
nnoremap gm :Merginal<cr>

"==========================================
""             pydocstring               ""
"==========================================
nnoremap <silent> gpd <Plug>(pydocstring)

"==========================================
""              easymotion               ""
"==========================================
map  <Leader>f <Plug>(easymotion-bd-f)
noremap <Leader>f <Plug>(easymotion-overwin-f)

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

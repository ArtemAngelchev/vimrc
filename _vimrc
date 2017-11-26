" Automatic reloading of _vimrc
autocmd! bufwritepost _vimrc source %

set nocompatible  " make vim behave equally in graphical mode and console mode
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
call plug#begin('~/vim/vimfiles/bundle')
  Plug 'zeis/vim-kolor'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'easymotion/vim-easymotion'
  Plug 'Raimondi/delimitMate'
  Plug 'ternjs/tern_for_vim'
  Plug 'tmhedberg/SimpylFold', {'for': 'python'}
  Plug 'Valloric/YouCompleteMe', {'for': ['java', 'python'], 'do': './vimfiles/bundle/YouCompleteMe/install.py'}
  Plug 'tpope/vim-fugitive'
  Plug 'scrooloose/nerdtree' 
  Plug 'vim-scripts/indentpython.vim'
  Plug 'mattn/emmet-vim', {'for': ['html', 'htmldjango']}
  Plug 'artur-shaik/vim-javacomplete2', {'for': 'java'}
  Plug 'majutsushi/tagbar', {'for': 'python'}
  Plug 'vim-syntastic/syntastic', {'for': 'python'}
call plug#end()

set langmenu=en_US
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Remove toolbar
set guioptions-=T

set encoding=utf-8
set fileencoding=utf-8

" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype on
filetype plugin on
filetype indent on
syntax enable

" Search and substitution options
set hlsearch    " highlight all the results of a particular search
set incsearch   " start searching immediately (incremental search)
set ignorecase  " not case sensitive search
set smartcase   " if in your search's request would Uppercase will search only it
set gdefault    " global flag default for substitute command

" Mouse and backspace options
set mouse=a                     " on OSX press ALT and click
set backspace=indent,eol,start  " make backspace behave like normal again


" Showing line numbers and length
set number           " show line numbers
set tw=99            " width of document (used by gd)
set nowrap           " don't automatically wrap on load
set fo-=t            " don't automatically wrap text when typing
set colorcolumn=100
highlight ColorColumn ctermbg=233

" Split windows options
set winwidth=86
set winheight=5
set winminheight=5
set winheight=999
set visualbell      " flash the screen instead of beeping
set cursorline      " highlight a line where cursor is

" Folding options
let g:SimpylFold_docstring_preview = 1
"autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
"autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
set nofoldenable


" To customize indent for a certain file's type go to ./vim80/ftplugin/[file type].vim
" and put at the bottom line 'setlocal expandtab shiftwidth=2 softtabstop=2'
set shiftround
set expandtab

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamed

" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","

" Quicksave command
noremap  <C-Z>      :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" Quick quit command
noremap <Leader>e :quit<CR> " Quit current window
noremap <Leader>E :qa!<CR>  " Quit all windows

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
noremap  <c-l> <c-w>l
noremap  <c-h> <c-w>h

"bind Ctrl+o to open all splits window except current
map <c-o> <c-w>o

"add new line by enter
map <Enter> o<ESC>
map <S-Enter> O<ESC>

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

"Set Color Scheme and Font Options
"colorscheme camo
colorscheme kolor
set guifont=Consolas:h11

" Useful settings
set history=700
set undolevels=700

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

"python with virtualenv support
py << EOF
import os
import sys
import vim

if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
#  sys.path.insert(0, project_base_dir)
#  activate_this = os.path.join(project_base_dir, 'Scripts/activate_this.py')
#  execfile(activate_this, dict(__file__=activate_this))
  python_binary_path = os.path.join(project_base_dir, 'Scripts/python.exe').replace('\\', '/')
  vim.command('let g:ycm_python_binary_path = "{}"'.format(python_binary_path))
EOF

" Settings for vim-airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

" Setting for tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'C:\Program Files (x86)\ctags58\ctags.exe'

" YCM {
" Navigating through the list of suggestion with ctrl+j and ctrl+k
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_getdoc_buffer_command = 'vertical-split'
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
map <S-k> :YcmCompleter GetDoc<CR>
" }

" jedi-vim {
let g:jedi#auto_initialization = 0
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
let g:jedi#show_call_signatures_delay = 0
"redefined default configs just to be able see it when i forget something 
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "<S-k>"
let g:jedi#rename_command = "<leader>r"
"""call jedi#configure_call_signatures()
"map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" NerdTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

" Java 1.8 autocomplition
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" syntastic
"" Recommended settings 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1

"" Display checker-name for that error-message                                  
let g:syntastic_aggregate_errors = 1        

"" I use the brew to install flake8                                             
let g:syntastic_python_checkers=['flake8']
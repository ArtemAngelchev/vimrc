" Automatic reloading of _vimrc
autocmd! bufwritepost _vimrc source %

set nocompatible  " make vim behave equally in graphical mode and console mode

set langmenu=en_US
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

set encoding=utf-8
set fileencoding=utf-8

" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype on
filetype plugin on
filetype indent on
syntax enable

" Setup Pathogen to manage your plugins
" mkdir -p ~/vimfiles/autoload ~/.vim/bundle
" curl -so ~/vimfiles/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
" Now you can install any plugin into a vimfiles/bundle/plugin-name/ folder
call pathogen#infect()

" Search and substitution options
set hlsearch  " highlight all the results of a particular search
set incsearch  " start searching immediately (incremental search)
set ignorecase  " not case sensitive search
set smartcase  " if in your search's request would Uppercase will search only it
set gdefault  " global flag default for substitute command

" Mouse and backspace options
set mouse=a " on OSX press ALT and click
set backspace=indent,eol,start  " make backspace behave like normal again

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Showing line numbers and length
set number " show line numbers
set tw=79 " width of document (used by gd)
set nowrap " don't automatically wrap on load
set fo-=t " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" Split windows options
set winwidth=86
set winheight=5
set winminheight=5
set winheight=999
set visualbell  " flash the screen instead of beeping
set cursorline  " highlight a line where cursor is

" Folding options
set foldmethod=marker
set foldmarker=#region,#endregion

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
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" Quick quit command
noremap <Leader>e :quit<CR> " Quit current window
noremap <Leader>E :qa!<CR> " Quit all windows

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"bind Ctrl+o to open all splits window except current
map <c-o> <c-w>o

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

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
colorscheme kolor
set guifont=Consolas:h12

" Useful settings
set history=700
set undolevels=700

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile


" ============================================================================
" Python IDE Setup
" ============================================================================
" Settings for vim-powerline
" cd ~/vimfiles/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2

" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Settings for python-mode
" Note: I'm no longer using this. Leave this commented out
" and uncomment the part about jedi-vim instead
" cd ~/vimfiles/bundle
"git clone https://github.com/klen/python-mode
let g:pymode_virtualenv = 1         " Auto fix vim python paths if virtualenv enabled        
let g:pymode_folding = 0            " Enable python folding                                 
let g:pymode_utils_whitespaces = 0  " Do not autoremove unused whitespaces  
                                
let g:pymode_syntax = 0                                           
let g:pymode_lint_ignore = "E265,C0110 Exported"  " ignore pep257 missing docstring warning
let g:pymode_lint_minheight = 5   " Minimal height of pylint error window          
let g:pymode_lint_maxheight = 15  " Maximal height of pylint error window 

let g:pymode_lint_write = 1  "Pylint checking every save    

""let g:pymode_run_key = "<leader>Q"  " default key conflicts with jedi-vim        
let g:pymode_lint_mccabe_complexity = 10                                        
let g:pymode_lint_checker = "pyflakes,pep8,pep257,mccabe"                         
let g:pymode_syntax_highlight_self=0  " do not highlight self                   

let g:pymode_doc = 0
let g:pymode_rope = 0

let g:pymode_run = 1
let g:pymode_python = "python"
let g:pymode_run_bind ='<F5>'

" Settings for jedi-vim
" cd ~/vimfiles/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 1
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = 1
let g:jedi#force_py_version = 2
""call jedi#configure_call_signatures()
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction
inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" Python folding
" mkdir -p ~/vimfiles/ftplugin
" wget -O ~/vimfiles/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
" set nofoldenable

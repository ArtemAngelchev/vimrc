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

""""""""""""""""""""""""""""""
" => Load plugins
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

"-------=== basic plugins ===-------
Plug 'jlanzarotta/bufexplorer'
Plug 'vim-scripts/mru.vim'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'amix/vim-zenroom2'
Plug 'itchyny/lightline.vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'mbbill/undotree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'wesQ3/vim-windowswap'
Plug 'mileszs/ack.vim'

Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'michaeljsmith/vim-indent-object'
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'luochen1990/rainbow'
Plug 'editorconfig/editorconfig-vim'
Plug 'majutsushi/tagbar'

Plug 'w0rp/ale'
Plug 'maralla/completor.vim', {'for': 'python'}
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}
Plug 'Chiel92/vim-autoformat'
Plug 'heavenshell/vim-pydocstring', {'for': 'python'}

Plug 'tpope/vim-fugitive'
Plug 'idanarye/vim-merginal'
Plug 'jreybert/vimagit'
Plug 'airblade/vim-gitgutter'

call plug#end()

syntax enable
filetype on

source ~/.vim/.vimrc/basic.vim
source ~/.vim/.vimrc/filetypes.vim
source ~/.vim/.vimrc/plugins_config.vim

" Don't automatically wrap on load
set nowrap

set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

set gfn=Anonymice\ Nerd\ Font\ Complete\ Mono\ 12

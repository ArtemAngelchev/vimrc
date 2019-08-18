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

""""""""""""""""""""""""""""""
" => Load plugins
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'MarcWeber/vim-addon-mw-utils'

Plug 'ryanoasis/vim-devicons'
Plug 'mbbill/undotree'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'

Plug 'junegunn/goyo.vim'
Plug 'amix/vim-zenroom2'
Plug 'wesQ3/vim-windowswap'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'

Plug 'luochen1990/rainbow'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-fugitive'
Plug 'idanarye/vim-merginal'
Plug 'jreybert/vimagit'
Plug 'airblade/vim-gitgutter'

Plug 'mileszs/ack.vim'

Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-python'
Plug 'neoclide/coc-json'

call plug#end()

source ~/.vim/.vimrc/basic.vim
" source ~/.vim/.vimrc/filetypes.vim
source ~/.vim/.vimrc/plugins_config.vim

set gfn=UbuntuMono\ Nerd\ Font\ Bold\ 11

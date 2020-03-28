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

Plug 'rafi/awesome-vim-colorschemes'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'mbbill/undotree'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'

Plug 'justinmk/vim-sneak'

Plug 'rickhowe/spotdiff.vim'
Plug 'rickhowe/diffchar.vim'

Plug 'wesQ3/vim-windowswap'

Plug 'tpope/vim-commentary'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}

call plug#end()

source ~/.vim/.vimrc/basic.vim
source ~/.vim/.vimrc/plugins_config.vim

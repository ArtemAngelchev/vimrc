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

Plug 'tmhedberg/SimpylFold'

call plug#end()

syntax enable
filetype on

" Don't automatically wrap on load
set nowrap

set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

set gfn=UbuntuMono\ Nerd\ Font\ Bold\ 11

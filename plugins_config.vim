"=============================================================
"                   maxbrunsfeld/vim-yankstack               "
"=============================================================
let g:yankstack_yank_keys = ['y', 'd']
nmap <c-p> <Plug>yankstack_substitute_older_paste
nmap <c-n> <Plug>yankstack_substitute_newer_paste

"=============================================================
"                  garbas/vim-snipmate                       "
"=============================================================
" (beside <TAB> support <CTRL-j>)
 ino <c-j> <c-r>=snipMate#TriggerSnippet()<cr>
 snor <c-j> <esc>i<right><c-r>=snipMate#TriggerSnippet()<cr>

"==============================================================
"                   mbbill/undotree                           "
"==============================================================
nnoremap <leader>u :UndotreeToggle<cr>

let g:undotree_CustomUndotreeCmd = 'vertical 32 new'
let g:undotree_CustomDiffpanelCmd = 'belowright 12 new'
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1

silent !mkdir ~/.vim/.undodir > /dev/null 2>&1
set undodir=~/.vim/.undodir/
set undofile

"=============================================================
"               Xuyuanp/nerdtree-git-plugin                  "
"=============================================================
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>o :NERDTreeToggle<cr>


let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "m",
    \ "Staged"    : "s",
    \ "Untracked" : "u",
    \ "Renamed"   : "r",
    \ "Unmerged"  : "um",
    \ "Deleted"   : "d",
    \ "Dirty"     : "~",
    \ "Clean"     : "ok",
    \ 'Ignored'   : "i",
    \ "Unknown"   : "?"
    \ }

"=============================================================
"                    majutsushi/tagbar                       "
"=============================================================
nmap <leader>t :TagbarToggle<CR>

"==============================================================
"                     junegunn/goyo.vim                       "
"==============================================================
let g:goyo_width=100
let g:goyo_margin_top = 1
let g:goyo_margin_bottom = 1
nnoremap <silent> <leader>z :Goyo<cr>

"=============================================================
"                      amix/vim-zenroom2                     "
"=============================================================
" enable all functions in all modes
let g:user_zen_mode='a'

"=============================================================
"                    luochen1990/rainbow                     "
"=============================================================
let g:rainbow_active = 1

"=============================================================
"               rafi/awesome-vim-colorschemes                "
"=============================================================
" show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

colorscheme deus

highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual

"==============================================================
"                    itchyny/lightline.vim                    "
"==============================================================
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }

"==============================================================
"                      vim-airline/vim-airline                "
"==============================================================
let g:airline_skip_empty_sections = 1
let g:airline#extensions#virtualenv#enabled = 0
let g:airline_section_c = airline#section#create_left(['%<%t%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#', '%{tagbar#currenttag(''[%s]'', '''', ''f'')}'])
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = airline#section#create_right(['%4l/%-4L', '%2c/%-2{strwidth(getline(''.''))}'])

"==========================================
""               merginal                ""
"==========================================
nnoremap <leader>m :Merginal<cr>

"==============================================================
"                    airblade/vim-gitgutter                   "
"==============================================================
let g:gitgutter_enabled=0
nnoremap <silent> <leader>`
      \ :GitGutterToggle <cr> :GitGutterLineHighlightsToggle <cr>

"==============================================================
"                            grep                             "
"==============================================================
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH

"==============================================================
"                      mileszs/ack.vim                        "
"==============================================================
" Use the the_silver_searcher if possible (much faster than Ack)
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
endif

" When you press gv you Ack after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" Open Ack and put the cursor in the right position
map <leader>a :Ack 

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with Ack, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>

"==============================================================
"                      Raimondi/delimitMate                   "
"==============================================================
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_inside_quotes = 1
let g:delimitMate_expand_cr = 2
let g:delimitMate_nesting_quotes = ['"','`']

"==============================================================
"                       tpope/vim-surround                    "
"==============================================================
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>


"==============================================================
"                    airblade/vim-gitgutter                   "
"==============================================================
let g:gitgutter_enabled=0
nnoremap <silent> <leader>`
      \ :GitGutterToggle <cr> :GitGutterLineHighlightsToggle <cr>

"==============================================================
"                            grep                             "
"==============================================================
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH

"==============================================================
"                      mileszs/ack.vim                        "
"==============================================================
" Use the the_silver_searcher if possible (much faster than Ack)
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
endif

" When you press gv you Ack after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" Open Ack and put the cursor in the right position
map <leader>a :Ack 

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with Ack, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>

"==============================================================
"                      Raimondi/delimitMate                   "
"==============================================================
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_inside_quotes = 1
let g:delimitMate_expand_cr = 2
let g:delimitMate_nesting_quotes = ['"','`']

"==============================================================
"                       tpope/vim-surround                    "
"==============================================================
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>

"==============================================================
"                      davidhalter/jedi-vim                   "
"==============================================================
au FileType python let jedi#show_call_signatures = 1
au FileType python let jedi#completion_enabled = 1
au FileType python let jedi#auto_vim_configuration = 1
au FileType python let jedi#popup_on_dot = 1
au FileType python let jedi#smart_auto_mappings = 1
au FileType python let jedi#show_call_signatures_delay = 10
au FileType python let jedi#usages_command = "<leader>U"
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "<C-k>"

"==============================================================
"                heavenshell/vim-pydocstring                  "
"==============================================================
nmap <silent> gd <Plug>(pydocstring)

"==============================================================
"                           w0rp/ale                          "
"==============================================================
let g:ale_linters = {
\   'javascript': ['jshint'],
\   'python': ['flake8', 'pylint'],
\   'go': ['go', 'golint', 'errcheck']
\}
let g:ale_python_pylint_options = '--disable=missing-docstring --unsafe-load-any-extension=y'
let g:ale_fixers = {'python': ['isort']}
let g:ale_python_isort_options = '-lai=2 -m=5 -e=true -tc=true'
noremap <leader>i :ALEFix isort<CR>

nmap <silent> <leader>q <Plug>(ale_next_wrap)

" Disabling highlighting
let g:ale_set_highlights = 0

" Only run linting when saving the file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

"==============================================================
"                   Chiel92/vim-autoformat                    "
"==============================================================
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
let g:formatdef_custom_yapf =
            \"'yapf --style=\"{
            \indent_width:'.shiftwidth().(&textwidth ? ',column_limit:'.&textwidth : '').',
            \based_on_style:facebook,
            \blank_line_before_nested_class_or_def:true,
            \}\"
            \ -l '.a:firstline.'-'.a:lastline
            \"
let g:formatters_python = ['custom_yapf']
noremap <leader>y :Autoformat<CR>

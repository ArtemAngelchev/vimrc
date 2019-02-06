""""""""""""""""""""""""""""""""
" => maxbrunsfeld/vim-yankstack
""""""""""""""""""""""""""""""""
let g:yankstack_yank_keys = ['y', 'd']
nmap <c-p> <Plug>yankstack_substitute_older_paste
nmap <c-n> <Plug>yankstack_substitute_newer_paste


""""""""""""""""""""""""""""""""
" => jlanzarotta/bufexplorer
""""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>b :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => vim-scripts/mru.vim
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>


""""""""""""""""""""""""""""""
" => ctrlp.vim
""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<c-f>'
map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'


""""""""""""""""""""""""""""""
" => ZenCoding
""""""""""""""""""""""""""""""
" Enable all functions in all modes
let g:user_zen_mode='a'


 """"""""""""""""""""""""""""""
 " => vim-snipmate (beside <TAB> support <CTRL-j>)
 """"""""""""""""""""""""""""""
 ino <c-j> <c-r>=snipMate#TriggerSnippet()<cr>
 snor <c-j> <esc>i<right><c-r>=snipMate#TriggerSnippet()<cr>


""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nerdtree-git-plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
    \ "Unmerged"  : "u",
    \ "Deleted"   : "d",
    \ "Dirty"     : "~",
    \ "Clean"     : "ok",
    \ 'Ignored'   : "i",
    \ "Unknown"   : "?"
    \ }

" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => vim-multiple-cursors
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:multi_cursor_use_default_mapping=0
"
" " Default mapping
" let g:multi_cursor_start_word_key      = '<C-s>'
" let g:multi_cursor_select_all_word_key = '<A-s>'
" let g:multi_cursor_start_key           = 'g<C-s>'
" let g:multi_cursor_select_all_key      = 'g<A-s>'
" let g:multi_cursor_next_key            = '<C-s>'
" let g:multi_cursor_prev_key            = '<C-p>'
" let g:multi_cursor_skip_key            = '<C-x>'
" let g:multi_cursor_quit_key            = '<Esc>'
"
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => surround.vim config
" " Annotate strings with gettext
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vmap Si S(i_<esc>f)
" au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coloreschemes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

colorscheme deus

highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-zenroom2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_width=100
let g:goyo_margin_top = 1
let g:goyo_margin_bottom = 1
nnoremap <silent> <leader>z :Goyo<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => undotree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>u :UndotreeToggle<cr>

let g:undotree_CustomUndotreeCmd = 'vertical 32 new'
let g:undotree_CustomDiffpanelCmd = 'belowright 12 new'
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1

silent !mkdir ~/.vim/.undodir > /dev/null 2>&1
set undodir=~/.vim/.undodir/
set undofile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ack.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic (syntax checker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=0
nnoremap <silent> <leader>` :GitGutterToggle<cr>


"==========================================
" => jedi-vim
"==========================================
let g:jedi#completion_enabled = 1
let g:jedi#auto_vim_configuration = 1
let g:jedi#show_call_signatures = 1
let g:jedi#smart_auto_mappings = 1
let g:jedi#show_call_signatures_delay = 10
let g:jedi#usages_command = "<leader>U"


py3 << EOF
import os
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  sys.path.insert(0, project_base_dir)
  python_binary_path = os.path.join(project_base_dir, 'bin', 'python')
  vim.command('let g:completor_python_binary = "{}"'.format(python_binary_path))
EOF


"==========================================
" => completor.vim
"==========================================
let g:completor_min_chars = 0
let g:completor_completion_delay = 10
inoremap <expr> <c-j> pumvisible() ? "\<c-n>" : "\<C-h>"
inoremap <expr> <c-k> pumvisible() ? "\<c-p>" : "\<C-k>"
inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
let g:completor_auto_trigger = 0
inoremap <expr> <c-@> pumvisible() ? "<c-N>" : "<c-r>=completor#do('complete')<cr>"
let g:completor_whitelist = ['python']


"==========================================
" => vim-expand-region
"==========================================
map gk <Plug>(expand_region_expand)
map gj <Plug>(expand_region_shrink)


"==========================================
""               merginal                ""
"==========================================
nnoremap <leader>m :Merginal<cr>

"==========================================
""             delimitMate               ""
"==========================================
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_inside_quotes = 1
let g:delimitMate_expand_cr = 2
let g:delimitMate_nesting_quotes = ['"','`']

"==========================================
""           vim-autoformat              ""
"==========================================
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

"==========================================
""           vim-pydocstring             ""
"==========================================

nmap <silent> gd <Plug>(pydocstring)

"==========================================
""         luochen1990/rainbow           ""
"==========================================
let g:rainbow_active = 1

"==========================================
""          majutsushi/tagbar            ""
"==========================================
nmap <leader>t :TagbarToggle<CR>

"==========================================
""       vim-airline/vim-airline         ""
"==========================================
let g:airline_skip_empty_sections = 1
let g:airline#extensions#virtualenv#enabled = 0
let g:airline_section_c = airline#section#create_left(['%<%t%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#', '%{tagbar#currenttag(''[%s]'', '''', ''f'')}'])
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = airline#section#create_right(['%4l/%-4L', '%2c/%-2{strwidth(getline(''.''))}'])

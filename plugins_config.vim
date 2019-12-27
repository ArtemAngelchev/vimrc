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


"=============================================================
"                       itchyny/lightline.vim                "
"=============================================================
let g:lightline = {
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'ctrlpmark', 'git', 'diagnostic', 'cocstatus', 'filename', 'method' ]
  \   ],
  \   'right':[
  \     [ 'filetype', 'fileencoding', 'lineinfo', 'percent' ],
  \     [ 'blame' ]
  \   ],
  \ },
  \ 'component_function': {
  \   'blame': 'LightlineGitBlame',
  \ }
\ }

function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  " return blame
  return winwidth(0) > 120 ? blame : ''
endfunction

" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()


"==============================================================
"                  scrooloose/nerdtree                        "
"==============================================================
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:NERDTreeWinPos = "right"
let g:NERDTreeShowHidden=0
let g:NERDTreeIgnore = [
  \ '\.git$',
  \ '\.DS_Store',
  \ '\.pyc$',
  \ '__pycache__',
  \ '\.mypy_cache',
  \ '\.pytest_cache',
  \]
let g:NERDTreeWinSize=35
map <leader>o :NERDTreeToggle<cr>


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
"                    majutsushi/tagbar                       "
"=============================================================
nmap <leader>t :TagbarToggle<CR>


"=============================================================
"                    mileszs/ack.vim                         "
"=============================================================
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
endif

map <leader>a :Ack 


"==============================================================
"                  neoclide/coc.nvim                          "
"==============================================================
inoremap <silent><expr> <NUL>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<NUL>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr> <c-j> pumvisible() ? "\<C-n>" : "\<c-j>"
inoremap <expr> <c-k> pumvisible() ? "\<C-p>" : "\<c-k>"

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <NUL> coc#refresh()
endif


" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>r <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Sort imports
nnoremap <silent> <leader>i  :<C-u>CocCommand python.sortImports<cr>


augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use <c-j> or <c-k> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <c-j> <Plug>(coc-range-select)
xmap <silent> <c-j> <Plug>(coc-range-select)
xmap <silent> <c-k> <Plug>(coc-range-select-backword)

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Show commands
nnoremap <silent> <space>m  :<C-u>CocList marketplace<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>



"==============================================================
"                  neoclide/coc-yank                          "
"==============================================================
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>


"==============================================================
"                    coc-highlight                            "
"==============================================================
autocmd CursorHold * silent call CocActionAsync('highlight')


"==============================================================
"                voldikss/coc-bookmark                        "
"==============================================================
nmap <Leader>bb <Plug>(coc-bookmark-toggle)
nmap <Leader>ba <Plug>(coc-bookmark-annotate)
nmap <Leader>bn <Plug>(coc-bookmark-next)
nmap <Leader>bp <Plug>(coc-bookmark-prev)

" Manage extensions
nnoremap <silent> <space>b  :<C-u>CocList bookmark<cr>

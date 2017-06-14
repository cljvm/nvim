
" => General
"------------------------------------------------

filetype off
filetype plugin indent on " Enable filetype
" let mapleader=',' " Change the mapleader
" let maplocalleader='\' " Change the maplocalleader
set timeoutlen=500 " Time to wait for a command
set ttimeoutlen=1000

" Source the vimrc file after saving it
"autocmd BufWritePost $MYVIMRC source $MYVIMRC
" Fast edit the .vimrc file using ,x
"nnoremap <Leader>x :tabedit $MYVIMRC<CR>

set autoread " Set autoread when a file is changed outside
set autowrite " Write on make/shell commands
set hidden " Turn on hidden"
set history=1000 " Increase the lines of history
set modeline " Turn on modeline
set encoding=utf-8 " Set utf-8 encoding

if has('nvim')
    let g:python3_host_prog='E:/Program Files/Python/Python35/python.exe'
    let g:python_host_prog='E:/Program Files/Python/Python27/python.exe'
endif

set undofile " Set undo

autocmd BufWinLeave *.* silent! mkview " Make Vim save view (state) (folds, cursor, etc)
autocmd BufWinEnter *.* silent! loadview " Make Vim load view (state) (folds, cursor, etc)

" Disable mouse
set mouse=

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-------------------------------------------------
" => User Interface
"-------------------------------------------------

" Set status line
set laststatus=2 " Show the statusline
set noshowmode " Hide the default mode text
let g:airline_theme='tender'
let g:bufferline_echo=0
let g:bufferline_modified='[+]'
let g:airline_powerline_fonts=1

" Set airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_section_z = airline#section#create(["\uE0A1" . '%{line(".")}' . " \uE0A3" . '%{col(".")}'])
let g:airline#extensions#whitespace#enabled = 0

" Only have cursorline in current window and in normal window
set wildmenu " Show list instead of just completing
set wildmode=list:longest,full " Use powerful wildmenu
set shortmess=at " Avoids hit enter
set showcmd " Show cmd

set backspace=indent,eol,start " Make backspaces delete sensibly
set whichwrap+=h,l,<,>,[,] " Backspace and cursor keys wrap to
set virtualedit=block,onemore " Allow for cursor beyond last character
set scrolljump=5 " Lines to scroll when cursor leaves screen
set scrolloff=3 " Minimum lines to keep above and below cursor
set sidescroll=1 " Minimal number of columns to scroll horizontally
set sidescrolloff=10 " Minimal number of screen columns to keep away from cursor

set showmatch " Show matching brackets/parenthesis
set matchtime=2 " Decrease the time to blink

set number " Show line numbers
set relativenumber " 显示相对行号

set formatoptions+=rnlmM " Optimize format options
set wrap " Set wrap
set textwidth=80 " Change text width
set list " Show these tabs and spaces and so on
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮ " Change listchars
set linebreak " Wrap long lines at a blank
set showbreak=↪  " Change wrap line break
set fillchars=diff:⣿,vert:│ " Change fillchars

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"-------------------------------------------------
" => Colors and Fonts
"-------------------------------------------------

" Use true colors
if (empty($TMUX))
    if (has('nvim'))
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    if (has('termguicolors'))
        set termguicolors
    endif
endif

syntax on " Enable syntax
set background=dark " Set background
set t_Co=256 " Use 256 colors

" Load a colorscheme
" colorscheme nord
colorscheme tender

" Enable italic
let g:nord_italic_comments=1
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"-------------------------------------------------
" => Indent Related
"-------------------------------------------------

set autoindent " Preserve current indent on new lines
set cindent " set C style indent
set expandtab " Convert all tabs typed to spaces
set softtabstop=4 " Indentation levels every four columns
set shiftwidth=4 " Indent/outdent by four columns
set shiftround " Indent/outdent to nearest tabstop

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"-------------------------------------------------
" => Search Related
"-------------------------------------------------

set ignorecase " Case insensitive search
set smartcase " Case sensitive when uc present
set hlsearch " Highlight search terms
set incsearch " Find as you type search
set gdefault " turn on g flag

" incsearch & asterisk
let g:incsearch#magic='\m'
let g:incsearch#auto_nohlsearch=1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl0)<Plug>(asterisk-z*)
map g* <Plug>(incsearch-nohl0)<Plug>(asterisk-gz*)
map #  <Plug>(incsearch-nohl0)<Plug>(asterisk-z#)
map g# <Plug>(incsearch-nohl0)<Plug>(asterisk-gz#)

" Toggle relativenumber
nnoremap <Leader>n :set relativenumber!<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"-------------------------------------------------
" => Fold Related
"-------------------------------------------------

set foldlevelstart=0 " Start with all folds closed
set foldcolumn=1 " Set fold column

" Space to toggle and create folds.
nnoremap <silent> <Space> @=(foldlevel('.') ? 'za' : '\<Space>')<CR>
vnoremap <Space> zf

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Same when jumping around

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" -> delimitMate
let delimitMate_expand_cr=1
let delimitMate_expand_space=1
let delimitMate_balance_matchpairs=1

" -> TComment
" Map \<Space> to commenting
function! IsWhiteLine()
    if (getline('.')=~'^$')
        exe 'TCommentBlock'
        normal! j
    else
        normal! A
        exe 'TCommentRight'
        normal! l
        normal! x
    endif
    startinsert!
endfunction
nnoremap <silent> <LocalLeader><Space> :call IsWhiteLine()<CR>

" -> Multiple cursors
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
    if has('nvim')
        let g:deoplete#disable_auto_complete=1
    else
        if has('lua')
            exe 'NeoCompleteLock'
        else
            exe 'NeoComplCacheLock'
        endif
    endif
endfunction
" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
    if has('nvim')
        let g:deoplete#disable_auto_complete=0
    else
        if has('lua')
            exe 'NeoCompleteUnlock'
        else
            exe 'NeoComplCacheUnlock'
        endif
    endif
endfunction

" -> Easy Align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" -> Investigate.vim
nnoremap K :call investigate#Investigate()<CR>
let g:investigate_use_dash = 1

" -> EnhancedDiff
let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'

" -> Quick-scope
let g:qs_max_chars=80

" -> Tag bar
nnoremap <Leader>t :TagbarToggle<CR>
let g:tagbar_autofocus=1
"let g:tagbar_expand=1
"let g:tagbar_foldlevel=2
"let g:tagbar_autoshowtag=1

" -> Gutentags
if has('nvim')
    let gutentags_cache_dir=$HOME . '/AppData/Local/nvim/cache/ctags'
else
    let g:gutentags_cache_dir=$HOME . '/vimfiles/cache/ctags'
endif

" -> NERD Tree
nnoremap <Leader>f :NERDTreeToggle<CR>
let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
augroup nerd_loader
    autocmd!
    autocmd VimEnter * silent! autocmd! FileExplorer
    autocmd BufEnter,BufNew *
                \  if isdirectory(expand('<amatch>'))
                \|   call plug#load('nerdtree')
                \|   execute 'autocmd! nerd_loader'
                \| endif
augroup END

" -> Neocomplete & Neocomplcache & Deoplete
" Use Tab and S-Tab to select candidate
inoremap <expr><Tab>  pumvisible() ? "\<C-N>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-P>" : "\<S-Tab>"
if has('nvim')
    " Use deoplete.
    let g:deoplete#enable_at_startup=1
    " Enable camel case completion
    let g:deoplete#enable_camel_case=1
else
    if has('lua')
        let g:neocomplete#enable_at_startup=1
        let g:neocomplete#data_directory=$HOME . '/vimfiles/cache/neocomplete'
        let g:neocomplete#enable_auto_delimiter=1
        " Use <C-E> to close popup
        inoremap <expr><C-E> neocomplete#cancel_popup()
        inoremap <expr><CR> delimitMate#WithinEmptyPair() ?
                    \ "\<C-R>=delimitMate#ExpandReturn()\<CR>" :
                    \ pumvisible() ? neocomplete#close_popup() : "\<CR>"
        " Setting for python
        if !exists('g:neocomplete#force_omni_input_patterns')
            let g:neocomplete#force_omni_input_patterns={}
        endif
        let g:neocomplete#force_omni_input_patterns.python=
        \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
        let g:neocomplete#force_omni_input_patterns.javascript='[^. \t]\.\w*'
    else
        let g:neocomplcache_enable_at_startup=1
        let g:neocomplcache_temporary_dir=$HOME . '/vimfiles/cache/neocomplcache'
        let g:neocomplcache_enable_auto_delimiter=1
        let g:neocomplcache_enable_fuzzy_completion=1
        " Use <C-E> to close popup
        inoremap <expr><C-E> neocomplcache#cancel_popup()
        inoremap <expr><CR> delimitMate#WithinEmptyPair() ?
                    \ "\<C-R>=delimitMate#ExpandReturn()\<CR>" :
                    \ pumvisible() ? neocomplcache#close_popup() : "\<CR>"
        " Setting for python
        if !exists('g:neocomplcache_force_omni_patterns')
            let g:neocomplcache_force_omni_patterns={}
        endif
        let g:neocomplcache_force_omni_patterns.python=
        \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
        let g:neocomplcache_force_omni_patterns.javascript='[^. \t]\.\w*'
    endif
    " Setting for jedi-vim
    "autocmd FileType python setlocal omnifunc=jedi#completions
    "let g:jedi#completions_enabled=0
    "let g:jedi#auto_vim_configuration=0
    "let g:jedi#smart_auto_mappings=0
    "let g:jedi#use_tabs_not_buffers=1
    " Setting for ternjs
    autocmd FileType javascript setlocal omnifunc=tern#Complete
endif
" Setting for tmux-complete
"let g:tmuxcomplete#trigger=''

" -> Neosnippet
" Use <C-K> to expand or jump snippets in insert or select mode
imap <C-K> <Plug>(neosnippet_expand_or_jump)
smap <C-K> <Plug>(neosnippet_expand_or_jump)
" Use <C-K> to replace TARGET within snippets in visual mode
xmap <C-K> <Plug>(neosnippet_expand_target)

" -> Ale
"let g:ale_linters = {'javascript': ['eslint']}
let g:ale_sign_column_always=1
let g:ale_sign_error='x'
let g:ale_sign_warning='!'
let g:ale_statusline_format = ['E %d', 'W %d', 'ok']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_text_changed = 'never'

nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
highlight ALEErrorSign guibg=NONE guifg=red
highlight ALEWarningSign guibg=NONE guifg=yellow

" -> Emmet
" let g:user_emmet_leader_key='<C-Z>'
" let g:user_emmet_settings={'indentation':'    '}
" let g:use_emmet_complete_tag=1

" -> Matchit
if !has('nvim')
    " Start matchit
    packadd! matchit
endif
" Use Tab instead of % to switch
" nmap <Tab> %
" vmap <Tab> %

" -> Vim-polyglot
let g:vim_markdown_conceal=0

"set guifont=Knack_NF:h12

" ctrlp
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_max_files = 500
" let g:ctrlp_max_depth = 20
" let g:ctrlp_working_path_mode = 'ra'
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" set wildignore+=*\\.git\\*,*\\.hg\\*,*\\.svn\\*  " Windows ('noshellslash')
" set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
" let g:ctrlp_custom_ignore = {
    " \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    " \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$'
" \ }
"noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
"noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
"noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
"noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

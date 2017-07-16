" => General
"------------------------------------------------

filetype off
filetype plugin indent on " Enable filetype
" let mapleader=',' " Change the mapleader
" let maplocalleader='\' " Change the maplocalleader
set timeoutlen=1000 " Time to wait for a command
set ttimeoutlen=500

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
set clipboard+=unnamedplus
" set completeopt=longest,menuone,preview

if has('win32')
    let g:python3_host_prog='E:/Program Files/Python/Python35/python.exe'
    let g:python_host_prog='E:/Program Files/Python/Python27/python.exe'
else
    let g:python3_host_prog='/usr/bin/python3'
    let g:python_host_prog='usr/bin/python'
endif

set undofile " Set undo

" Disable mouse
set mouse=

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-------------------------------------------------
" => User Interface
"-------------------------------------------------

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

" Show title.
set title
" Title length.
set titlelen=95
" Title string.
let &g:titlestring="%{expand('%:p:~:.')}%(%m%r%w%)%<\(%{fnamemodify(getcwd(), ':~')}\)"

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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"-------------------------------------------------
" => Fold Related
"-------------------------------------------------

set foldlevelstart=0 " Start with all folds closed
set foldcolumn=1 " Set fold column


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

" -> Gutentags
if has('nvim')
    let gutentags_cache_dir=$HOME . '/AppData/Local/nvim/cache/ctags'
else
    let g:gutentags_cache_dir=$HOME . '/vimfiles/cache/ctags'
endif

if owl#plug_setting('vim-airline')
    let g:airline_powerline_fonts = 1
    let g:airline_theme = 'tender'
    let g:airline#extensions#tmuxline#enabled = 0
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#tab_min_count = 2
    let g:airline#extensions#bufferline#overwrite_variables = 1
    let g:airline#extensions#bufferline#enabled = 1
    let g:airline#extensions#tabline#show_buffers = 0
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline#extensions#whitespace#enabled = 0
    let g:airline_section_z = airline#section#create(["\uE0A1" . '%{line(".")}' . " \uE0A3" . '%{col(".")}'])
endif

if owl#plug_setting('vim-bufferline')
    let g:bufferline_echo = 0
endif

if owl#plug_setting('tender.vim')
    colorscheme tender
endif

if owl#plug_setting('ale')
    let g:ale_sign_column_always=1
    let g:ale_sign_error="\uF00d"
    let g:ale_sign_warning="\uF12A"
    let g:ale_statusline_format = ["E %d", "W %d", "ok"]
    let g:ale_echo_msg_error_str = "E"
    let g:ale_echo_msg_warning_str = "W"
    let g:ale_echo_msg_format = "[%linter%] %s [%severity%]"
    let g:ale_lint_on_text_changed = "never"
    let g:ale_javascript_eslint_use_global = 0
    highlight ALEErrorSign guibg=NONE guifg=red
    highlight ALEWarningSign guibg=NONE guifg=yellow
    " let g:ale_linters = {'javascript': ['eslint']}
endif

if owl#plug_setting('denite.nvim')
    if executable('rg')
        call denite#custom#var('file_rec', 'command', ['rg', '--files', '--glob', '!.git'])
        call denite#custom#var('grep', 'command', ['rg', '--threads', '1'])
        call denite#custom#var('grep', 'recursive_opts', [])
        call denite#custom#var('grep', 'final_opts', [])
        call denite#custom#var('grep', 'separator', ['--'])
        call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])
    else
        call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
    endif

    call denite#custom#source('file_old', 'matchers', ['matcher_fuzzy', 'matcher_project_files'])
    if has('nvim')
        call denite#custom#source('file_rec,grep', 'matchers', ['matcher_cpsm'])
    endif
    call denite#custom#source('file_old', 'converters', ['converter_relative_word'])


    call denite#custom#alias('source', 'file_rec/git', 'file_rec')
    call denite#custom#var('file_rec/git', 'command', ['git', 'ls-files', '-co', '--exclude-standard'])

    " call denite#custom#option('default', 'prompt', '>')
    " call denite#custom#option('default', 'short_source_names', v:true)
    call denite#custom#option('default', {
                \ 'prompt': '>',
                \ 'short_source_names': v:true,
                \ })

    call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
                \ [ '.git/', '.ropeproject/', '__pycache__/',
                \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])
endif

if owl#plug_setting('deoplete.nvim')
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#enable_camel_case=1
    let g:deoplete#enable_refresh_always = 1
    let g:deoplete#enable_camel_case = 1
    " let g:deoplete#auto_complete_delay = 50
    " let g:deoplete#auto_complete_start_length = 3
    let g:deoplete#skip_chars = ['(', ')']
    " let g:deoplete#enable_profile = 1
    " call deoplete#enable_logging('DEBUG', 'deoplete.log')

    let g:deoplete#keyword_patterns = {}
    let g:deoplete#keyword_patterns._ = '[a-zA-Z_]\k*\(?'
    " let g:deoplete#keyword_patterns.tex = '\\?[a-zA-Z_]\w*'
    let g:deoplete#keyword_patterns.tex = '[^\w|\s][a-zA-Z_]\w*'

    let g:deoplete#omni#input_patterns = {}
    let g:deoplete#omni#input_patterns.python = ''
    let g:deoplete#omni#functions = {}

    let g:deoplete#sources = {}
    let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']

    call deoplete#custom#set('_', 'sorters', ['sorter_word'])
    call deoplete#custom#set('_', 'matchers', ['matcher_full_fuzzy'])
    " call deoplete#custom#set('_', 'matchers', ['matcher_head'])
    " call deoplete#custom#set('_', 'disabled_syntaxes', ['Comment', 'String'])
    " Use auto delimiter
    " call deoplete#custom#set('_', 'converters',
    "       \ ['converter_auto_paren',
    "       \  'converter_auto_delimiter', 'remove_overlap'])
    call deoplete#custom#set('_', 'converters', [
                \ 'converter_remove_paren',
                \ 'converter_remove_overlap',
                \ 'converter_truncate_abbr',
                \ 'converter_truncate_menu',
                \ 'converter_auto_delimiter',
                \ ])

    call deoplete#custom#set('ultisnips', 'rank', 200)
    call deoplete#custom#set('ultisnips', 'sorters', ['sorter_word'])
    " call deoplete#custom#set('ghc', 'sorters', ['sorter_word'])
    " call deoplete#custom#set('buffer', 'mark', '')
    " call deoplete#custom#set('buffer', 'mark', '*')
    " call deoplete#custom#set('buffer', 'min_pattern_length', 9999)
    " call deoplete#custom#set('clang', 'input_pattern', '\.\w*|\.->\w*|\w+::\w*')
    " call deoplete#custom#set('clang', 'max_pattern_length', -1)
    " call deoplete#custom#set('clang', 'debug_enabled', 1)
endif

if owl#plug_setting('neosnippet.vim')
    let g:neosnippet#enable_snipmate_compatibility = 1
    let g:neosnippet#enable_completed_snippet = 1
    let g:neosnippet#expand_word_boundary = 1
    let g:neosnippet#snippets_directory = get(g:, 'nvim_config_home', expand('%:p:h')) . owl#separator() . 'snippets'
endif

if owl#plug_setting('tagbar')
    let g:tagbar_autofocus = 1
endif

if owl#plug_setting('nerdtree')
    let NERDTreeChDirMode=2
    let NERDTreeShowBookmarks=1
    let NERDTreeShowHidden=1
    let NERDTreeShowLineNumbers=1
endif

if owl#plug_setting('vim-polyglot')
    let g:vim_markdown_conceal=0
    let g:polyglot_disabled = ['javascript', 'rust']
endif

if owl#plug_setting('incsearch.vim')
    let g:incsearch#magic='\m'
    let g:incsearch#auto_nohlsearch=1
endif

if owl#plug_setting('delimitMate')
    let delimitMate_expand_cr=1
    let delimitMate_expand_space=1
    let delimitMate_balance_matchpairs=1
endif

if owl#plug_setting('vim-diff-enhanced')
    let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
endif

if owl#plug_setting('ultisnips')
    let g:UltiSnipsExpandTrigger="<C-k>"
    let g:UltiSnipsJumpForwardTrigger="<Tab>"
    let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"
endif

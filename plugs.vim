let s:base_dir = expand('<sfile>:h')
"let s:plug_vim = s:base_dir . owl#separator() . 'autoload' . owl#separator() . 'plug.vim'
let s:plugged_dir = s:base_dir . owl#separator() . 'plugged'

call plug#begin(s:plugged_dir)
" 外观
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'arcticicestudio/nord-vim'
" Plug 'cljvm/tender.vim'
Plug 'ryanoasis/vim-devicons'

" Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'chemzqm/vim-easygit'
Plug 'chemzqm/denite-git'
Plug 'mhinz/vim-signify'
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on_cmd': [ 'NERDTreeToggle',  'NERDTreeTabsToggle'] }

" 编辑
Plug 'terryma/vim-multiple-cursors'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'godlygeek/tabular'
Plug 'matze/vim-move'
Plug 'tpope/vim-speeddating'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'Raimondi/delimitMate'
Plug 'roxma/vim-paste-easy'
Plug 'haya14busa/vim-asterisk' " Improved asterisk
Plug 'AdamWhittingham/vim-copy-filename'
Plug 'Chiel92/vim-autoformat', { 'do': 'npm install -g eslint'} "格式化代码（调用外部工具：eslint、js-beautify等）
Plug 'bkad/CamelCaseMotion' " Camel case motion

" 自动补全
Plug 'shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'
Plug 'rust-lang/rust.vim'
Plug 'carlitux/deoplete-ternjs' " 需要安装tern(nodejs)
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets' " extra snippets

" 语言分析(Linting)
Plug 'w0rp/ale'

" 语法高亮 
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim' " javascript syntax
Plug 'sheerun/vim-polyglot' " 语法高亮包，支持大多数语言
Plug 'PeterRincker/vim-argumentative'
Plug 'Olical/vim-syntax-expand'
<<<<<<< Updated upstream
Plug 'ap/vim-css-color'
=======
Plug 'Shougo/context_filetype.vim'
>>>>>>> Stashed changes

" 编程环境
Plug 'klen/python-mode'
Plug 'metakirby5/codi.vim'

" 查找、替换
" Plug 'dyng/ctrlsf.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'haya14busa/incsearch.vim'

" Vim 扩展
" Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'Shougo/denite.nvim'
Plug 'roman/golden-ratio'
Plug 'chrisbra/vim-diff-enhanced'

" NeoVim Terminal 扩展
Plug 'vimlab/split-term.vim'
Plug 'wvffle/vimterm'

" 工具栏
Plug 'majutsushi/tagbar'
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
Plug 'scrooloose/nerdtree', { 'on': [ 'NERDTreeToggle',  'NERDTreeTabsToggle'] }
Plug 'jistr/vim-nerdtree-tabs', { 'on': [ 'NERDTreeToggle',  'NERDTreeTabsToggle'] }
Plug 'bling/vim-bufferline'
Plug 'ludovicchabant/vim-gutentags' " Manage tag files

" 会话管理
Plug 'tpope/vim-obsession'
"Plug 'vim-ctrlspace/vim-ctrlspace'
"Plug 'floobits/floobits-neovim'
call plug#end()

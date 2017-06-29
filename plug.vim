let s:base_dir = expand('<sfile>:h')
"let s:plug_vim = s:base_dir . owl#separator() . 'autoload' . owl#separator() . 'plug.vim'
let s:plugged_dir = s:base_dir . owl#separator() . 'plugged'

call plug#begin(s:plugged_dir)
" 插件管理
Plug 'Shougo/dein.vim'
Plug 'haya14busa/dein-command.vim'

" 外观
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jacoborus/tender.vim'
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
Plug 'vim-asterisk'
Plug 'AdamWhittingham/vim-copy-filename'
Plug 'Chiel92/vim-autoformat'

" 自动补全
Plug 'shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'
Plug 'rust-lang/rust.vim'
Plug 'carlitux/deoplete-ternjs') " 需要安装tern(nodejs
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" 语言分析(Linting)
Plug 'w0rp/ale'

" 语法高亮 
Plug 'pangloss/vim-javascript'
Plug 'sheerun/vim-polyglot'
Plug 'PeterRincker/vim-argumentative'
Plug 'Olical/vim-syntax-expand'

" 编程环境
Plug 'klen/python-mode'
Plug 'metakirby5/codi.vim'

" 查找、替换
Plug 'dyng/ctrlsf.vim'
" TODO 使用 'lotabout/skim' 代替，以支持中文
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'haya14busa/incsearch'

" Vim 扩展
" Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'neovim/python-client'
Plug 'Shougo/denite.nvim'
Plug 'roman/golden-ratio'

" NeoVim Terminal 扩展
Plug 'vimlab/split-term.vim'
Plug 'wvffle/vimterm'

" 工具栏
Plug 'majutsushi/tagbar'
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
Plug 'scrooloose/nerdtree', { 'on': [ 'NERDTreeToggle',  'NERDTreeTabsToggle'] }
Plug 'jistr/vim-nerdtree-tabs', { 'on': [ 'NERDTreeToggle',  'NERDTreeTabsToggle'] }
Plug 'bling/vim-bufferline'

" 会话管理
Plug 'tpope/vim-obsession'
"Plug 'vim-ctrlspace/vim-ctrlspace'
"Plug 'floobits/floobits-neovim'
call plug#end()

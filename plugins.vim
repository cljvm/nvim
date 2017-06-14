let s:base_dir = split(&runtimepath, ",")[0]
let s:plugin_base_dir = s:base_dir . '/plugins'
let s:dein_dir = s:plugin_base_dir . '/repos/github.com/Shougo/dein.vim'

set runtimepath+=s:dein_dir

if dein#load_state(s:plugin_base_dir)
    call dein#begin(s:plugin_base_dir)

    " dein 自己管理自己
    dein#add('Shougo/dein.vim')
    
    " 外观
    dein#add('bling/vim-airline')
    dein#add('vim-airline/vim-airline-themes')
    dein#add('jacoborus/tender.vim')
    dein#add('ryanoasis/vim-devicons')

    " Tmux
    dein#add('christoomey/vim-tmux-navigator')
    dein#add('edkolev/tmuxline.vim')

    " Git
    dein#add('tpope/vim-fugitive')
    dein#add('airblade/vim-gitgutter')
    dein#add('chemzqm/vim-easygit')
    dein#add('chemzqm/denite-git')
    dein#add('mhinz/vim-signify')
    dein#add('Xuyuanp/nerdtree-git-plugin', { 'on_cmd': [ 'NERDTreeToggle',  'NERDTreeTabsToggle'] })

    " 编辑
    dein#add('terryma/vim-multiple-cursors')
    dein#add('justinmk/vim-sneak')
    dein#add('tpope/vim-surround')
    dein#add('tomtom/tcomment_vim')
    dein#add('godlygeek/tabular')
    dein#add('matze/vim-move')
    dein#add('tpope/vim-speeddating')
    dein#add('junegunn/rainbow_parentheses.vim')
    dein#add('Raimondi/delimitMate')
    dein#add('roxma/vim-paste-easy')
    dein#add('vim-asterisk')
    dein#add('AdamWhittingham/vim-copy-filename')
    dein#add('Chiel92/vim-autoformat')

    " 自动补全
    dein#add('shougo/deoplete.nvim')
    dein#add('zchee/deoplete-jedi')
    dein#add('rust-lang/rust.vim')
    dein#add('carlitux/deoplete-ternjs') " 需要安装tern(nodejs)
    dein#add('Shougo/neosnippet.vim')
    dein#add('Shougo/neosnippet-snippets')

    " Linting
    dein#add('w0rp/ale')

    " 编程扩展
    dein#add('pangloss/vim-javascript')
    dein#add('sheerun/vim-polyglot')
    dein#add('PeterRincker/vim-argumentative')
    dein#add('Olical/vim-syntax-expand')

    " 编程环境
    dein#add('klen/python-mode')
    dein#add('metakirby5/codi.vim')

    " 查找、替换
    dein#add('dyng/ctrlsf.vim')
    " TODO 使用 'lotabout/skim' 代替，以支持中文
    dein#add('junegunn/fzf')
    dein#add('junegunn/fzf.vim')
    dein#add('haya14busa/incsearch')

    " Vim 扩展
    " dein#add('tpope/vim-dispatch')
    dein#add('tpope/vim-repeat')
    dein#add('tpope/vim-unimpaired')
    dein#add('tpope/vim-abolish')
    dein#add('neovim/python-client')
    dein#add('Shougo/denite.nvim')
    dein#add('roman/golden-ratio')

    " NeoVim Terminal 扩展
    dein#add('vimlab/split-term.vim')
    dein#add('wvffle/vimterm')

    " 工具栏
    dein#add('majutsushi/tagbar')
    dein#add('sjl/gundo.vim', { 'on': 'GundoToggle' })
    dein#add('scrooloose/nerdtree', { 'on': [ 'NERDTreeToggle',  'NERDTreeTabsToggle'] })
    dein#add('jistr/vim-nerdtree-tabs', { 'on': [ 'NERDTreeToggle',  'NERDTreeTabsToggle'] })
    dein#add('bling/vim-bufferline')

    " 会话管理
    dein#add('tpope/vim-obsession')
    "dein#add('vim-ctrlspace/vim-ctrlspace')
    "dein#add('floobits/floobits-neovim')

    call dein#end()
    call dein#save_state()
endif

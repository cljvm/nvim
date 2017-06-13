if dein#load_state(path)
    call dein#begin(path)
    " 外观
    dein#add('bling/vim-airline')
    dein#add('vim-airline/vim-airline-themes')
    dein#add('arcticicestudio/nord-vim')
    dein#add('junegunn/seoul256.vim')
    " Tmux
    dein#add('christoomey/vim-tmux-navigator')
    dein#add('edkolev/tmuxline.vim')
    " Git
    dein#add('tpope/vim-fugitive')
    dein#add('chemzqm/vim-easygit')
    dein#add('chemzqm/denite-git')
    dein#add('mhinz/vim-signify')
    dein#add('Xuyuanp/nerdtree-git-plugin', { 'on': [ 'NERDTreeToggle',  'NERDTreeTabsToggle'] })
    " 编辑
    dein#add('terryma/vim-multiple-cursors')
    dein#add('justinmk/vim-sneak')
    dein#add('tpope/vim-surround')
    dein#add('tpope/vim-commentary')
    dein#add('godlygeek/tabular')
    dein#add('matze/vim-move')
    " dein#add('vim-expand-region')
    dein#add('tpope/vim-speeddating')
    dein#add('kana/vim-textobj-user')
    dein#add('kana/vim-textobj-line')
    dein#add('kana/vim-textobj-entire')
    dein#add('junegunn/rainbow_parentheses.vim')
    " 文字处理 
    dein#add('reedes/vim-wordy')
    dein#add('reedes/vim-pencil')
    dein#add('junegunn/goyo.vim')
    dein#add('junegunn/limelight.vim')
    " Autocompletion and Snippets
    dein#add('shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' })
    dein#add('zchee/deoplete-jedi', { 'for': 'python'})
    dein#add('Shougo/neosnippet.vim')
    dein#add('Shougo/neosnippet-snippets')
    " Linting
    dein#add('neomake/neomake')
    " dein#add('ludovicchabant/vim-gutentags')
    " Programming Extensions
    dein#add('bitc/vim-hdevtools')
    dein#add('pangloss/vim-javascript')
    dein#add('sheerun/vim-polyglot')
    dein#add('PeterRincker/vim-argumentative')
    dein#add('Olical/vim-syntax-expand')
    " Programming Setups
    dein#add('klen/python-mode')
    dein#add('metakirby5/codi.vim')
    " Fuzzy Finding and Subsitution)
    dein#add('junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' })
    dein#add('junegunn/fzf.vim')
    " Vim Extensions
    " dein#add('tpope/vim-dispatch')
    dein#add('tpope/vim-repeat')
    dein#add('tpope/vim-unimpaired')
    dein#add('tpope/vim-abolish')
    dein#add('neovim/python-client')
    dein#add('Shougo/denite.nvim')
    " Terminal Emulator Extensions
    dein#add('vimlab/split-term.vim')
    dein#add('wvffle/vimterm')
    " Sidebars
    dein#add('majutsushi/tagbar')
    dein#add('sjl/gundo.vim', { 'on': 'GundoToggle' })
    dein#add('scrooloose/nerdtree', { 'on': [ 'NERDTreeToggle',  'NERDTreeTabsToggle'] })
    dein#add('jistr/vim-nerdtree-tabs', { 'on': [ 'NERDTreeToggle',  'NERDTreeTabsToggle'] })
    " Session Management
    dein#add('tpope/vim-obsession')
    "dein#add('vim-ctrlspace/vim-ctrlspace')
    dein#add('floobits/floobits-neovim')
    " Alternative Uses
    "dein#add('blindFS/vim-taskwarrior')
    call dein#end()
    call dein#save_state()
endif

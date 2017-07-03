nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap g; g;zz
nnoremap g, g,zz

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Strip all trailing whitespace in the current file
nnoremap <silent> <Leader>q :%s/\s\+$//e<CR>:let @/=''<CR>

" Modify all the indents
nnoremap <Leader>= gg=G

noremap <C-Tab> :<C-U>tabnext<CR>
inoremap <C-Tab> <C-O>:tabnext<CR>
cnoremap <C-Tab> <C-C>:tabnext<CR>

nnoremap <silent> <Space> @=(foldlevel('.') ? 'za' : '\<Space>')<CR>
vnoremap <Space> zf

nnoremap <Leader>n :set relativenumber!<CR>

"xmap ga <Plug>(EasyAlign)
"nmap ga <Plug>(EasyAlign)

" help
nnoremap <silent><F1> :call owl#toggle_help()<CR>
nnoremap <Leader>hh :call owl#toggle_help()<CR>
nnoremap <Leader>hk :Maps<CR>

" buffer
nnoremap <leader>bl :buffers<CR> " buffer list
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>
nnoremap <Leader>bcn :call owl#copy_buffer_name()<CR>
nnoremap <Leader>by mxggyG`x<CR>

" windows
nnoremap <Leader>w <C-W>

if owl#plug_setting('tcomment_vim')
    function! CommentAppendLine()
        if (getline('.')=~'^\s*$')
            execute 'TCommentBlock'
        else
            execute "normal! A\<Space>\<Space>"
            execute 'TCommentRight'
        endif
        startinsert!
    endfunction
    nnoremap <silent> <LocalLeader><Space> :call CommentAppendLine()<CR>
endif

if owl#plug_setting('ale')
    nmap <silent> [w <Plug>(ale_previous)
    nmap <silent> ]w <Plug>(ale_next)
endif

if owl#plug_setting('denite.nvim')
    nnoremap <silent> <Leader>r
                \ :<C-u>Denite -buffer-name=register
                \ register<CR>
    xnoremap <silent> <Leader>r
                \ :<C-u>Denite -default-action=replace -buffer-name=register
                \ register<CR>

    nnoremap <silent> <Leader>/ :<C-u>Denite -buffer-name=search
                \ line<CR>
    nnoremap <silent> <Leader>* :<C-u>DeniteCursorWord -buffer-name=search
                \ -mode=normal line<CR>
    nnoremap <silent> <Leader>s :<C-u>Denite file_point file_old
                \ `finddir('.git', ';') != '' ? 'file_rec/git' : 'file_rec'`<CR>

    nnoremap <silent><expr> tt  &filetype == 'help' ?  "g\<C-]>" :
                \ ":\<C-u>DeniteCursorWord -buffer-name=tag -immediately
                \  tag:include\<CR>"
    nnoremap <silent><expr> tp  &filetype == 'help' ?
                \ ":\<C-u>pop\<CR>" : ":\<C-u>Denite -mode=normal jump\<CR>"

    nnoremap <silent> [dowWindow]n :<C-u>Denite dein<CR>
    nnoremap <silent> <Leader>g :<C-u>Denite -buffer-name=search
                \ -no-empty -mode=normal grep<CR>
    nnoremap <silent> n :<C-u>Denite -buffer-name=search
                \ -resume -mode=normal -refresh<CR>
    nnoremap <silent> <Leader>ft :<C-u>Denite filetype<CR>
    nnoremap <silent> <C-k> :<C-u>Denite -mode=normal change jump<CR>

    nnoremap <silent> <Leader>gs :<C-u>Denite gitstatus<CR>
    nnoremap <silent> <Leader>ch
                \ :<C-u>Denite command command_history<CR>
endif

if owl#plug_setting('neosnippet.vim')
    imap <C-K> <Plug>(neosnippet_expand_or_jump)
    smap <C-K> <Plug>(neosnippet_expand_or_jump)
    " Use <C-K> to replace TARGET within snippets in visual mode
    xmap <C-K> <Plug>(neosnippet_expand_target)
endif

if owl#plug_setting('tagbar')
    nnoremap <Leader>tt :TagbarToggle<CR>
endif

if owl#plug_setting('nerdtree')
    nnoremap <Leader>f :NERDTreeToggle<CR>
endif

if owl#plug_setting('incsearch.vim')
    map /  <Plug>(incsearch-forward)
    map ?  <Plug>(incsearch-backward)
    map g/ <Plug>(incsearch-stay)
    map n  <Plug>(incsearch-nohl-n)
    map N  <Plug>(incsearch-nohl-N)
    map *  <Plug>(incsearch-nohl0)<Plug>(asterisk-z*)
    map g* <Plug>(incsearch-nohl0)<Plug>(asterisk-gz*)
    map #  <Plug>(incsearch-nohl0)<Plug>(asterisk-z#)
    map g# <Plug>(incsearch-nohl0)<Plug>(asterisk-gz#)
endif

if owl#plug_setting('deoplete.nvim')
    " <TAB>: completion.
    inoremap <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ deoplete#manual_complete()
    function! s:check_back_space() abort "{{{
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~ '\s'
    endfunction"}}}

    " <S-TAB>: completion back.
    inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"

    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"

    inoremap <expr><C-g> deoplete#undo_completion()
    " <C-l>: redraw candidates
    inoremap <expr><C-l>       deoplete#refresh()

    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function() abort
        return deoplete#cancel_popup() . "\<CR>"
    endfunction

    inoremap <expr> '  pumvisible() ? deoplete#close_popup() : "'"
endif


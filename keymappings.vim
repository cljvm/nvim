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
nnoremap \= gg=G

noremap <C-Tab> :<C-U>tabnext<CR>
inoremap <C-Tab> <C-O>:tabnext<CR>
cnoremap <C-Tab> <C-C>:tabnext<CR>

nnoremap <silent> <Space> @=(foldlevel('.') ? 'za' : '\<Space>')<CR>
vnoremap <Space> zf

nnoremap <Leader>n :set relativenumber!<CR>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" help
nnoremap <silent><F1> :call owl#toggle_help()<CR>
nnoremap <leader>hh :call owl#toggle_help()<CR>
nnoremap <leader>hk :Maps<CR>

" buffer
nnoremap <leader>bcn :call CopyBufferName()<CR>

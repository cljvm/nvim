"-------------------------------------------------
" global function define
"-------------------------------------------------

function! owl#separator()  abort "{{{
  return !exists("+shellslash") || &shellslash ? '/' : '\'
endfunction "}}}

function! owl#resolve_path(path)  abort "{{{
  return resolve(expand(a:path))
endfunction "}}}

function! owl#toggle_option(opt) abort "{{{
    exe 'setlocal' a:opt.'!'
    exe 'setlocal' a:opt.'?'
endfunction "}}}

function! owl#enable_filetype() abort "{{{
    if exe('filetype') =~# 'OFF'
        silent! filetype plugin indent on
        syntax enable
        filetype detect
    endif
endfunction "}}}

function! owl#toggle_help() abort "{{{
	if s:HasHelp()
        :helpclose
    else
        :help
    endif
endfunction "}}}

function! owl#copy_buffer_name() "{{{
    let bufname = ''
    for buf in getbufinfo()
        if(!buf.hidden)
            let bufname = bufname . buf.name . "\n" " 此处换行只能用双引号
        endif
    endfor
    echo bufname
    let @+ = bufname
endf "}}}



"-------------------------------------------------
" script function define
"-------------------------------------------------

function! s:HasHelp() "{{{
    for winfo in getwininfo()
        if getbufvar(winfo.bufnr, '&buftype') ==# 'help' " 大小写敏感比较
            return 1
        endif
    endfor
    return 0
endfunction "}}}
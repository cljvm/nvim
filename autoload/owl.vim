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

function! owl#plug_exists(name) abort "{{{
    if !exists('g:plugs')
        echoerr 'plugin manager is not vim-plug, can not find plugin "'.name
        return 0
    endif
    if(!has_key(g:plugs, name))
        echomsg 'no plugin named "'.name.'" managed by vim-plug.'
        return 0
    endif
    return 1
endfunction

function! owl#plug_setting(name) abort "{{{
    if !owl#plug_exists(name)
        echomsg '------------------------ Skip "'.name.'" Setting ------------------------'
        return 0
    endif
    return 1
endfunction



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

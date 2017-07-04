" vimrc files
"for s:path in split(globpath('<sfile>:h', 'nvim/*.vim'), "\n")
"  exe 'source ' . s:path
"endfor
"

let g:nvim_config_home = expand('<sfile>:p:h')

function! s:source_rc(...) abort
    for rc in a:000
        execute 'source' resolve(g:nvim_config_home . owl#separator() . rc)
    endfor
endfunction

call s:source_rc('plugs.vim', 'settings.vim', 'keymappings.vim', 'commands.vim')

call owl#enable_filetype()


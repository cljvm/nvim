" vimrc files
"for s:path in split(globpath('<sfile>:h', 'nvim/*.vim'), "\n")
"  exe 'source ' . s:path
"endfor
"

let g:nvim_config_home = expand('<sfile>:p:h')

function! s:source_rc(...) abort
    for rc in a:000
        let rc_file = resolve(g:nvim_config_home . owl#separator() . rc)
        if filereadable(rc_file)
            execute 'source' rc_file
        endif
    endfor
endfunction

call s:source_rc('plugs.vim', 'settings.vim', 'keymappings.vim', 'commands.vim', 'custom.vim')

call owl#enable_filetype()


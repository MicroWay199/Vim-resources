if has('nvim')
else
    set nocompatible
    source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin

    set diffexpr=MyDiff()
    function MyDiff()
        let opt = '-a --binary '
        if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
        if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
        let arg1 = v:fname_in
        if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
        let arg2 = v:fname_new
        if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
        let arg3 = v:fname_out
        if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
        let eq = ''
        if $VIMRUNTIME =~ ' '
            if &sh =~ '\<cmd'
                let cmd = '""' . $VIMRUNTIME . '\diff"'
                let eq = '"'
            else
                let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
            endif
        else
            let cmd = $VIMRUNTIME . '\diff'
        endif
        silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
    endfunction
endif
"==================================================================
"ÅäÖÃÁÐ±í¼ÓÔØ
"==================================================================
let g:islinux = 0
let g:iswindows = 0

if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:islinux = 1
endif

if(g:iswindows)
    source $VIM\micro_plugin\micro_comm.vim
    source $VIM\micro_plugin\micro_keymap.vim
    source $VIM\micro_plugin\micro_file_header.vim
    source $VIM\micro_plugin\micro_misc.vim
    source $VIM\micro_plugin\micro_verilog_cfg.vim
    source $VIM\micro_plugin\micro_perl.vim
else 
    source ~/github/vim-resources/micro_plugin/micro_comm.vim
    source ~/github/vim-resources/micro_plugin/micro_keymap.vim
    source ~/github/vim-resources/micro_plugin/micro_file_header.vim
    source ~/github/vim-resources/micro_plugin/micro_misc.vim
    source ~/github/vim-resources/micro_plugin/micro_verilog_cfg.vim
    source ~/github/vim-resources/micro_plugin/micro_perl.vim
endif

"" windows 到 linux下，提示^M为未知命令，使用dos2unix命令
"" 将windows下的换行符(\n\r)替换为linux下的换行符(\n)
"" sudo apt install dos2unix
"" dos2unix filename


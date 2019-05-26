""map <leader>m ^hhR//
map <leader>m  :call Commented()<cr>
function Commented()
   exe "normal ^"
   let cur_pos     = getcurpos()
   let cur_column  = cur_pos[2] 
   if cur_column == 1
     exe "normal i//"
   elseif cur_column ==2
     exe "normal hxi//"
   elseif cur_column >2
     exe "normal hhR//"
   endif
endf

""map÷¥––shell√¸¡Ó
"map <leader>c :silent !start cmd.exe /C echo HAHAHA &pause 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickly Run
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <Leader>c :call CompileRunGcc()<CR>

func! CompileRunGcc()
    exec "w!" 
    if &filetype == 'c' 
        exec '!g++ % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'cpp'
        exec '!g++ % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'python'
        "exec '!time python %'
         exec '!python %'
    elseif &filetype == 'sh'
        :!time bash %
    endif                                                                              
endfunc 

source $VIMRUNTIME/macros/matchit.vim 
"if not work well,use autocmd BufNweFile,BufRead *   let b:match_wrods 
let b:match_wrods='\<begin\>:\<end\>'
                  \ .  '\<module\>:\<endmodule\>' 
                  \ .  '\<case\>:\<endcase\>' "can added any pairs like this 


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

map <Leader>mc :call CompileRunGcc()<CR>

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
runtime! macros/matchit.vim 
"if not work well,use autocmd BufNweFile,BufRead *   let b:match_wrods 
let b:match_wrods='\<begin\>:\<end\>' .
                \ '\<module\>:\<endmodule\>' .
                \ '\<case\>:\<endcase\>' "can added any pairs like this 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickly replace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>mr :call V_quick_replace()<CR>

func! V_quick_replace()
    let old_word = expand("<cword>")
    let new_word = input("replace " . old_word .  " by:")
    let range_r = input("replace @all file? if yes, input /gg/:")
    let replace_range = "normal " . range_r
    exec replace_range
    let cur_pos   = getcurpos()
    let cur_line  = cur_pos[1] 
   "let replace_cmd = printf('%%s/%s/%s/gc',old_word,new_word)
    let replace_cmd = cur_line . ",$" . "s/" . "\\<" . old_word . "\\>" . "/" . new_word . "/gc"
    exec replace_cmd
  " do the command like : normal gg | 1,$s/old/new/gc
endfunc 

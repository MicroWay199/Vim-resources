""对齐verilog instance例化
"vmap <Leader>a :'<,'>s/\(\w\+\).*(\(.*\))/\=printf("%-20s(%-20s)",submatch(1),submatch(2))<CR>
"nmap <Leader>a :s/\(\w\+\).*(\(.*\))/\=printf("%-20s(%-20s)",submatch(1),submatch(2))<CR>
"上述命令由下面函数替代，功能几乎等价，只是格式化得更好一点
vmap <Leader>is :call V_align_inst_line()<CR>
nmap <Leader>is :call V_align_inst_line()<CR>
function V_align_inst_line()
    let line_begin = line("'<")
    let line_end   = line("'>")
    let max_inst = 0
    let max_con = 0
    for i in range(line_begin, line_end)
        let line_str  = getline(i)
        if (line_str =~ '^\s*\..*')
            "参考函数：match matchlist subtitute
          ""let line_comp = matchlist(line_str,'\(\w\+\).*(\(.*\))\(.*\)')
           "let line_comp = matchlist(line_str,'\(\w\+\).*(\(\S*\{-}\))\(.*\)')
            let line_comp = matchlist(line_str,'\.\s*\(\w\+\S*\)\s*(\s*\(\w*\S*\)\s*)\(.*\)')
           "echo line_comp
            let inst_name = get(line_comp, 1)
            let con_name  = get(line_comp, 2)
            let other     = get(line_comp, 3)
            let len_inst  = strlen(inst_name)
            let len_con   = strlen(con_name)

            if(len_inst > max_inst)
                let max_inst = len_inst
            endif
            if(len_con > max_con)
                let max_con = len_con
            endif
            
            if(len_inst > 30)
                echom (inst_name . "variable name too long")
            endif
            if(len_con > 30)
                echom (con_name . "variable name too long")
            endif
        endif
    endfor

    for i in range(line_begin, line_end)
        let line_str  = getline(i)
        if (line_str =~ '^\s*\..*')
            "参考函数：match matchlist subtitute
          ""let line_comp = matchlist(line_str,'\(\w\+\).*(\(.*\))\(.*\)')
            let line_comp = matchlist(line_str,'\.\s*\(\w\+\S*\)\s*(\s*\(\w*\S*\)\s*)\(.*\)')
           "echo line_comp
            let inst_name = get(line_comp, 1)
            let con_name  = get(line_comp, 2)
            let other     = get(line_comp, 3)
            if(max_inst < 10)
                let inst_name = printf('%-10s', inst_name)
            elseif(max_inst < 20)
                let inst_name = printf('%-20s', inst_name)
            elseif(max_inst < 25)
                let inst_name = printf('%-25s', inst_name)
            else
                let inst_name = printf('%-30s', inst_name)
            endif

            if(max_con < 10)
                let con_name = printf('%-10s', con_name)
            elseif(max_con < 20)
                let con_name = printf('%-20s', con_name)
            elseif(max_con < 25)
                let con_name = printf('%-25s', con_name)
            else
                let con_name = printf('%-30s', con_name)
            endif
           "echo max_inst . "  " . max_con

            let line_out  = printf('    .%-s(%-s)%s', inst_name, con_name, other)
            call setline(i, line_out)
        endif
    endfor
endfunction

vmap <Leader>if :call V_align_io()<CR>
nmap <Leader>if :call V_align_io()<CR>
function V_align_io()
    let line_begin = line("'<")
    let line_end   = line("'>")
    let max_len = 0
    let max_wid = 0
    for i in range(line_begin, line_end)
        let line_str  = getline(i)
        if (line_str =~ '^\s*\(input\|inout\|output\|reg\|wire\).*')
            "参考函数：match matchlist subtitute
            if (line_str =~ '^\s*\(input\|output\).*')
                let line_comp = matchlist(line_str,'\(input\|output\)\s*\(reg\|wire\|\)\s*\(\[.*\]\|\)\s*\(\w[a-zA-Z0-9\[\]:_]*\)\s*\(,\|\)\s*\(\/\/.*\|\)\s*$')
               "echo line_comp
                let io    = get(line_comp, 1)
                let regw  = get(line_comp, 2)
                let width = get(line_comp, 3)
                let name  = get(line_comp, 4)
                let comma = get(line_comp, 5)
                let other = get(line_comp, 6)
            else
                let line_comp = matchlist(line_str,'\s*\(reg\|wire\)\s*\(\[.*\]\|\)\s*\(\w[a-zA-Z0-9\[\]:_]*\)\s*\(;\)\s*\(\/\/.*\|\)\s*$')
               "echo line_comp
                let io    = ""
                let regw  = get(line_comp, 1)
                let width = get(line_comp, 2)
                let name  = get(line_comp, 3)
                let comma = get(line_comp, 4)
                let other = get(line_comp, 5)
            endif
            
            let len_name = strlen(name)
            if(len_name > max_len)
                let max_len = len_name
            endif
            if(len_name > 30)
                echom(name . "variable name too long")
            endif

            let len_wid = strlen(width)
            if(len_wid > max_wid)
                let max_wid = len_wid
            endif
        endif
    endfor

    for i in range(line_begin, line_end)
        let line_str  = getline(i)
        if (line_str =~ '^\s*\(input\|inout\|output\|reg\|wire\).*')
            "参考函数：match matchlist subtitute
            if (line_str =~ '^\s*\(input\|output\).*')
                let line_comp = matchlist(line_str,'\(input\|output\)\s*\(reg\|wire\|\)\s*\(\[.*\]\|\)\s*\(\w[a-zA-Z0-9\[\]:_]*\)\s*\(,\|\)\s*\(\/\/.*\|\)\s*$')
               "echo line_comp
                let io    = get(line_comp, 1)
                let regw  = get(line_comp, 2)
                let width = get(line_comp, 3)
                let name  = get(line_comp, 4)
                let comma = get(line_comp, 5)
                let other = get(line_comp, 6)
            else
                let line_comp = matchlist(line_str,'\s*\(reg\|wire\)\s*\(\[.*\]\|\)\s*\(\w[a-zA-Z0-9\[\]:_]*\)\s*\(;\)\s*\(\/\/.*\|\)\s*$')
               "echo line_comp
                let io    = ""
                let regw  = get(line_comp, 1)
                let width = get(line_comp, 2)
                let name  = get(line_comp, 3)
                let comma = get(line_comp, 4)
                let other = get(line_comp, 5)
            endif

            if(max_len < 10)
                let name = printf('%-10s', name)
            elseif(max_len < 20)
                let name = printf('%-20s', name)
            elseif(max_len < 30)
                let name = printf('%-30s', name)
            else
                let name = printf('%-40s', name)
            endif

            if(max_wid < 10)
                let width = printf('%-10s', width)
            elseif(max_wid < 20)
                let width = printf('%-20s', width)
            elseif(max_wid < 25)
                let width = printf('%-25s', width)
            else
                let width = printf('%-30s', width)
            endif

            if (io == "")
                let io = ""
            else
                let io = printf('    %-8s', io)
            endif
            "echo line_comp
            let line_out_pre  = printf(' %-6s %-s %-s %1s %-s', regw, width, name, comma, other)
            let line_out = io . line_out_pre
            "echo line_out
            call setline(i, line_out)
        endif
    endfor
endfunction

vmap <Leader>ie :call V_align_eval()<CR>
nmap <Leader>ie :call V_align_eval()<CR>
function V_align_eval()
    let line_begin = line("'<")
    let line_end   = line("'>")
    let max_left = 0
    let max_right = 0
    let indent_s     = " "
    let name_left    = " "
    let eq_s         = " "
    let name_right   = " "
    let comment      = " "
    let assign_s     = " "
    for i in range(line_begin, line_end)
        let line_str  = getline(i)
        if (line_str =~ '^\s*\w*.*')
            if (line_str =~ '^\s*assign\s+.*')
          "  "参考函数：match matchlist subtitute
                let line_comp = matchlist(line_str,'\(\s*\)assign\s\+\(\w\S*\)\s*\(=\|<=\)\s*\(\w\S*\)\s*;\s*\(.*\)')
               "let line_comp = matchlist(line_str,'^\s*assign\s+\(\w.*\)\s*\(=\|<=\)\s*\(\w.*\)\s*;\s*\(.*\)')
               "echo line_comp
                let indent_s     = get(line_comp, 1)
                let name_left    = get(line_comp, 2)
                let eq_s         = get(line_comp, 3)
                let name_right   = get(line_comp, 4)
                let comment      = get(line_comp, 5)
                let assign_s     = "assign "
            elseif (line_str =~ '^\s*\w.*')
                let line_comp = matchlist(line_str,'\(\s*\)\(\w\S*\)\s*\(=\|<=\)\s*\(\w\S*\)\s*;\s*\(.*\)')
               "let line_comp = matchlist(line_str,'^\s*\(\w.*\)\s*\(=\|<=\)\s*\(\w.*\)\s*;\s*\(.*\)')
               "echo line_comp
                let indent_s     = get(line_comp, 1)
                let name_left    = get(line_comp, 2)
                let eq_s         = get(line_comp, 3)
                let name_right   = get(line_comp, 4)
                let comment      = get(line_comp, 5)
                let assign_s     = ""
            endif

            let len_left  = strlen(name_left)
            let len_right = strlen(name_right)
            if(len_left > max_left)
                let max_left = len_left
            endif
            if(len_right > max_right)
                let max_right = len_right
            endif

            if(len_left > 30)
                echom(name_left . "variable name too long")
            endif

            if(len_right > 30)
                echom(name_right . "variable name too long")
            endif
        endif
    endfor

    for i in range(line_begin, line_end)
        let line_str  = getline(i)
        if (line_str =~ '^\s*\w*.*')
            if (line_str =~ '^\s*assign\s+.*')
          "  "参考函数：match matchlist subtitute
                let line_comp = matchlist(line_str,'\(\s*\)assign\s\+\(\w\S*\)\s*\(=\|<=\)\s*\(\w\S*\)\s*;\s*\(.*\)')
               "let line_comp = matchlist(line_str,'^\s*assign\s+\(\w.*\)\s*\(=\|<=\)\s*\(\w.*\)\s*;\s*\(.*\)')
               "echo line_comp
                let indent_s     = get(line_comp, 1)
                let name_left    = get(line_comp, 2)
                let eq_s         = get(line_comp, 3)
                let name_right   = get(line_comp, 4)
                let comment      = get(line_comp, 5)
                let assign_s     = "assign "
            elseif (line_str =~ '^\s*\w.*')
                let line_comp = matchlist(line_str,'\(\s*\)\(\w\S*\)\s*\(=\|<=\)\s*\(\w\S*\)\s*;\s*\(.*\)')
               "let line_comp = matchlist(line_str,'^\s*\(\w.*\)\s*\(=\|<=\)\s*\(\w.*\)\s*;\s*\(.*\)')
               "echo line_comp
                let indent_s     = get(line_comp, 1)
                let name_left    = get(line_comp, 2)
                let eq_s         = get(line_comp, 3)
                let name_right   = get(line_comp, 4)
                let comment      = get(line_comp, 5)
                let assign_s     = ""
            endif

            if(max_left < 10)
                let name_left = printf('%-10s', name_left)
            elseif(max_left < 20)
                let name_left = printf('%-20s', name_left)
            elseif(max_left < 25)
                let name_left = printf('%-25s', name_left)
            else
                let name_left = printf('%-30s', name_left)
            endif

            if(max_right < 10)
                let name_right = printf('%-10s', name_right)
            elseif(max_right < 20)
                let name_right = printf('%-20s', name_right)
            elseif(max_right < 25)
                let name_right = printf('%-25s', name_right)
            else
                let name_right = printf('%-30s', name_right)
            endif

            let indent_s  = printf('%s',indent_s)
            let assign_s  = printf('%-s',assign_s)
            let eq_s      = printf('%-2s',eq_s)
            let comment   = printf('%-s',comment)
            "echo line_comp
            let line_out  = indent_s . assign_s . name_left . eq_s . name_right . ";" . comment
            "echo line_out
            call setline(i, line_out)
        endif
    endfor
endfunction

vmap <Leader>vw :Vwavedrom 
nmap <Leader>vw :Vwavedrom 
":Vwavedrom 7
command -range=% -nargs=+ Vwavedrom :call V_wavedrom(<args>) 
function V_wavedrom(n_len)
    let line_begin = line("'<")
    let line_end   = line("'>")
    let line_str   = ""
    for k in range(line_begin, line_end,2)
        let name     = ""
        let dot      = ""
        let dot_len  = 0
        let line_u   = ""
        let line_d   = ""
        let line_str  = getline(k+1)
       "if (line_str =~ 'SN\S*\s+.*SD\S*')
        if (line_str =~ 'SN:.*SD:.*')
            let line_comp = matchlist(line_str,'\(SN:\S*\)\s\+.*SD:\(\S*\)')
            let name      = line_comp[1]
            let dot       = line_comp[2]
            let dot_len   = strlen(dot)
            let dot_list  = ""
            for i_parse in range(dot_len)
                if(i_parse == 0) 
                    if(dot[0] == ".")
                        let dot_list = dot_list . "z"
                    else 
                        let dot_list = dot_list . dot[0]
                    endif
                   "echo dot_list
                else 
                    if(dot[i_parse] == ".")
                        let dot_list = dot_list . dot_list[i_parse-1]
                    else 
                        let dot_list = dot_list . dot[i_parse]
                    endif
                   "echo dot_list
                endif
            endfor
           "echo dot_list
           "
            for i_drow in range(dot_len)
                if (i_drow==0)        
                "" when wave start
                    if(dot_list[i_drow] == "0")
                        let line_u = line_u . "  "
                        let line_d = line_d . "__"
                    elseif(dot_list[i_drow] == "1")
                        let line_u = line_u . "__"
                        let line_d = line_d . "  "
                    elseif(dot_list[i_drow] == "z")
                        let line_u = line_u . "  "
                        let line_d = line_d . "--"
                    elseif((dot_list[i_drow] == "2") || (dot_list[i_drow] == "3"))
                        let line_u = line_u . "__"
                        let line_d = line_d . "__"
                    else 
                        let line_u = line_u . "??"
                        let line_d = line_d . "??"
                    endif
                else 
                    if(dot_list[i_drow] == "0")
                        if(dot_list[i_drow-1] == "0")
                            let line_u = line_u . "  "
                            let line_d = line_d . "__"
                        elseif (dot_list[i_drow-1] == "1")
                            let line_u = line_u . "  "
                            let line_d = line_d . "\\_"
                        elseif (dot_list[i_drow-1] == "z")
                            let line_u = line_u . "  "
                            let line_d = line_d . "\\_"
                        elseif((dot_list[i_drow-1] == "2") || (dot_list[i_drow-1] == "3"))
                            let line_u = line_u . "  "
                            let line_d = line_d . "\\_"
                        endif
                    elseif(dot_list[i_drow] == "1")
                        if(dot_list[i_drow-1] == "0")
                            let line_u = line_u . " _"
                            let line_d = line_d . "/ "
                        elseif (dot_list[i_drow-1] == "1")
                            let line_u = line_u . "__"
                            let line_d = line_d . "  "
                        elseif (dot_list[i_drow-1] == "z")
                            let line_u = line_u . " _"
                            let line_d = line_d . "/ "
                        elseif((dot_list[i_drow-1] == "2") || (dot_list[i_drow-1] == "3"))
                            let line_u = line_u . " _"
                            let line_d = line_d . "/ "
                        endif
                    elseif(dot_list[i_drow] == "z")
                        if(dot_list[i_drow-1] == "0")
                            let line_u = line_u . "  "
                            let line_d = line_d . "+-"
                        elseif (dot_list[i_drow-1] == "1")
                            let line_u = line_u . "  "
                            let line_d = line_d . "+-"
                        elseif (dot_list[i_drow-1] == "z")
                            let line_u = line_u . "  "
                            let line_d = line_d . "--"
                        elseif((dot_list[i_drow-1] == "2") || (dot_list[i_drow-1] == "3"))
                            let line_u = line_u . "  "
                            let line_d = line_d . "+-"
                        endif
                    elseif((dot_list[i_drow] == "2") || (dot_list[i_drow] == "3"))
                        if(dot_list[i_drow-1] == "0")
                            let line_u = line_u . " _"
                            let line_d = line_d . "/_"
                        elseif (dot_list[i_drow-1] == "1")
                            let line_u = line_u . " _"
                            let line_d = line_d . "\\_"
                        elseif (dot_list[i_drow-1] == "z")
                            let line_u = line_u . " _"
                            let line_d = line_d . "/_"
                        elseif((dot_list[i_drow-1] == "2") || (dot_list[i_drow-1] == "3"))
                            if(dot_list[i_drow] == dot_list[i_drow-1])
                                let line_u = line_u . "__"
                                let line_d = line_d . "__"
                            else
                                let line_u = line_u . " _"
                                let line_d = line_d . "X_"
                            endif
                        endif
                    endif " end else
                endif " end if i_drow
            endfor  

            if(a:n_len < 5)
                let name_u = printf("%-5s",'')
                let name_d = printf("%-5s",name)
            elseif (a:n_len < 10)
                let name_u = printf("%-10s",'')
                let name_d = printf("%-10s",name)
            elseif (a:n_len < 15)
                let name_u = printf("%-15s",'')
                let name_d = printf("%-15s",name)
            elseif (a:n_len < 20)
                let name_u = printf("%-20s",'')
                let name_d = printf("%-20s",name)
            elseif (a:n_len < 25)
                let name_u = printf("%-25s",'')
                let name_d = printf("%-25s",name)
            else
                let name_u = printf("%-30s",'')
                let name_d = printf("%-30s",name)
            endif


            let line_u_s = printf("\\\\%-s    %-s",name_u,line_u)
            let line_d_s = printf("\\\\%-s SW:%-s   SD:%-s",name_d,line_d,dot)
            call setline(k,line_u_s)
            call setline(k+1,line_d_s)
        endif " end repx
    endfor
endfunction


nmap <Leader>vs :Vseq
"command -range=% -nargs=+ Vseq :call V_seq(<f-args>) 
" <f-args>会自动转换格式为函数需要的格式
":Vseq xxx<seq>yyy<seq> 0 16 2 此处不建议，因为插入序列中肯定有空格，空格认为是参数分割符
"command -range=% -nargs=+ Vseq :call V_seq(<q-args>) 
":Vseq 'xxx<seq>yyy<seq>',0,16,2
":Vseq 'xxx<seq>yyy<seq>',0,16,-2
command -range=% -nargs=1 Vseq :call V_seq(<args>) 

function! V_seq(seq_str,start,num,step)
    let seq_str = a:seq_str
    
    let num     = str2nr(a:num)  
    let step    = str2nr(a:step)
    if(a:start =~ '[a-zA-Z]')
        let is_char_seq = 1
    else
        let is_char_seq = 0
    endif
    if(is_char_seq == 1)
       let start = char2nr(a:start)
    else
       let start = str2nr(a:start)
    endif
       
    let end_num = start + num *step
    let str_start = printf("%d",start)
    let str_end = printf("%d",end_num)
    let str_len_s = strlen(str_start)
    let str_len_e = strlen(str_end)
    if(is_char_seq == 1)
        let str_len = 1
    else
        if(str_len_s > str_len_e)
            let str_len = str_len_s
        else
            let str_len = str_len_e
        endif
    endif
    
    let line_out = ''

    for i_s in range(num)
        let num_str = ''
        let num_str_s = []
        let num_str_l = 0
        let num_str_o = ''
        let num_dec = start + step * i_s
        if(is_char_seq == 1)
            let num_str_o = nr2char(num_dec)
        else
            let num_str = printf('%d',num_dec)
            let num_str = '0000' . num_str
            let num_str_l = strlen(num_str)
            let num_str_p = num_str_l - str_len
           "let num_str_o = num_str[num_str_l-3] . num_str[num_str_l-2] . num_str[num_str_l-1]
            let num_str_o = strcharpart(num_str,num_str_p,str_len)
        endif
        let line_out = substitute(seq_str,"<seq>",num_str_o,"g")
        call append((line('.')+i_s),line_out)
    endfor


endfunction

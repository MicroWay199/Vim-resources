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

"==================================================================
"����б�
"==================================================================
"neocomplcache 
"==================================================================

"==================================================================
"""""" map keys  use :h map for more information
"==================================================================
inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>
inoremap begin begin<cr><cr>end<up>
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
map Q gq  "����ӳ���ʽ����ݼ�������Ĭ��Q gq������
"tab  �������
map <tab> :tabn<CR>
map <s-tab> :tabp<CR>
map n<tab> :tabnew

let mapleader="\<space>"
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
""mapִ��shell����
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

"==================================================================
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"�����趨
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""set nu " �к� 
"set relativenumber "����к�
set mouse=a  "˫��ѡ��bar����tags�ȣ�˫����Ч
set noerrorbells  " ����vim��������ĵε���
set gcr=a:blinkon0 "ȡ�������˸
" �ҵ�״̬����ʾ�����ݣ������ļ����ͺͽ��룩
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]    "��ʾ�ļ���: ������, �ܵ��ַ���
set ruler
set magic
"colorscheme night"�������� 
"colorscheme biogoo"�������� 
colorscheme molokai"�������� 
set cc=80 "hight 80th column  cc means colorcolumn also set corlorcolumn=80 work
set cursorline "������ʾ��ǰ��
""can set several options operately
"hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"" sʹ��autocmd�������colorshceme�趨֮��ĳ�ͻ
autocmd BufRead,BufNew * hi CursorLine guibg=black 
set cursorcolumn  "������ʾ��ǰ��
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
autocmd BufRead,BufNew * hi CursorColumn guibg=black 
set nobackup                 " �����ޱ����ļ�
"printf�������ظ�ʽ���ַ���
set backupdir=printf("%s,%s",getcmd()��"/vi_backup/")
set noswapfile 
set noundofile 
let autosave = 300 "ÿ300s�Զ�����һ��"
"let as = 300  "as  ����autosave����˼
set showmatch               "����ƥ��
set laststatus=2            "������ʾ״̬��
set autoread                "�ļ���Vim֮���޸Ĺ����Զ����¶���
syntax enable
syntax on
set ai                      "�Զ�����
set autoindent               " �Զ���������
set smartindent
set autochdir            "�Զ����õ�ǰĿ¼Ϊ���ڱ༭��Ŀ¼
set backspace=2            "�����˸������
set clipboard+=unnamed   " ��windows���������
set guifont=Consolas:h12
"set guifont=Courier\ New:h11   "\ Ϊת���ַ�  ת��ո�
autocmd GUIEnter * simalt ~x "windows������֮��Ĭ�����
set guioptions=+m   "��ʾ�˵������������������ʾ
"set guioptions=+T   "��ʾ������,guioptions�����������ֻ�ܸ�һ��ֵ��

set scrolloff=3   "���ù������λ����ߺ���͵��߽�����Ϊ3
set incsearch
set autoindent               " �Զ�����
set softtabstop=2 "set tab = insertspace
"�������Ϊ4���ַ�"  
set shiftwidth=4  
"tab���Ϊ4���ַ�"  
"set tabstop=4  
""�༭ʱ������tab�滻Ϊ�ո�"  
set et  
set expandtab                " ��Tab�Զ�ת���ɿո�[��Ҫ����������Tab��ʱ��ʹ�� Ctrl+V + Tab]
"set ft = c   "filetype�趨
"
syntax enable                " ���﷨����
syntax on                    " �����ļ��������
filetype indent on           " ��Բ�ͬ���ļ����Ͳ��ò�ͬ��������ʽ
filetype plugin on           " ��Բ�ͬ���ļ����ͼ��ض�Ӧ�Ĳ��
filetype plugin indent on    " �����Զ���ȫ

" ӳ���л�buffer�ļ�λ
"������ı���������������
set scrolloff=3
set nowrap 
set autochdir  "�Զ���ת����ǰ�ļ�Ŀ¼
source $VIMRUNTIME/macros/matchit.vim 
"if not work well,use autocmd BufNweFile,BufRead *   let b:match_wrods 
let b:match_wrods='\<begin\>:\<end\>'
                  \ .  '\<module\>:\<endmodule\>' 
                  \ .  '\<case\>:\<endcase\>' "can added any pairs like this 

""����verilog instance����
"vmap <Leader>a :'<,'>s/\(\w\+\).*(\(.*\))/\=printf("%-20s(%-20s)",submatch(1),submatch(2))<CR>
"nmap <Leader>a :s/\(\w\+\).*(\(.*\))/\=printf("%-20s(%-20s)",submatch(1),submatch(2))<CR>
"�������������溯����������ܼ����ȼۣ�ֻ�Ǹ�ʽ���ø���һ��
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
            "�ο�������match matchlist subtitute
          ""let line_comp = matchlist(line_str,'\(\w\+\).*(\(.*\))\(.*\)')
           "let line_comp = matchlist(line_str,'\(\w\+\).*(\(\S*\{-}\))\(.*\)')
            let line_comp = matchlist(line_str,'\.\s*\(\w\+\S*\)\s*(\(\w*\S*\)\s*)\(.*\)')
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
            "�ο�������match matchlist subtitute
          ""let line_comp = matchlist(line_str,'\(\w\+\).*(\(.*\))\(.*\)')
            let line_comp = matchlist(line_str,'\.\s*\(\w\+\S*\)\s*(\(\w*\S*\)\s*)\(.*\)')
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
    for i in range(line_begin, line_end)
        let line_str  = getline(i)
        if (line_str =~ '^\s*\(input\|inout\|output\|reg\|wire\).*')
            "�ο�������match matchlist subtitute
            if (line_str =~ '^\s*\(input\|output\).*')
                let line_comp = matchlist(line_str,'\(input\|output\)\s*\(reg\|wire\|\)\s*\(\[.*\]\|\)\s*\([a-zA-Z0-9\[\]:_]\+\)\s*\(,\|\)\s*\(\/\/.*\|\)\s*$')
               "echo line_comp
                let io    = get(line_comp, 1)
                let regw  = get(line_comp, 2)
                let width = get(line_comp, 3)
                let name  = get(line_comp, 4)
                let comma = get(line_comp, 5)
                let other = get(line_comp, 6)
            else
                let line_comp = matchlist(line_str,'\s*\(reg\|wire\)\s*\(\[.*\]\|\)\s*\([a-zA-Z0-9\[\]:_]\+\)\s*\(;\)\s*\(\/\/.*\|\)\s*$')
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
        endif
    endfor

    for i in range(line_begin, line_end)
        let line_str  = getline(i)
        if (line_str =~ '^\s*\(input\|inout\|output\|reg\|wire\).*')
            "�ο�������match matchlist subtitute
            if (line_str =~ '^\s*\(input\|output\).*')
                let line_comp = matchlist(line_str,'\(input\|output\)\s*\(reg\|wire\|\)\s*\(\[.*\]\|\)\s*\([a-zA-Z0-9\[\]:_]\+\)\s*\(,\|\)\s*\(\/\/.*\|\)\s*$')
               "echo line_comp
                let io    = get(line_comp, 1)
                let regw  = get(line_comp, 2)
                let width = get(line_comp, 3)
                let name  = get(line_comp, 4)
                let comma = get(line_comp, 5)
                let other = get(line_comp, 6)
            else
                let line_comp = matchlist(line_str,'\s*\(reg\|wire\)\s*\(\[.*\]\|\)\s*\([a-zA-Z0-9\[\]:_]\+\)\s*\(;\)\s*\(\/\/.*\|\)\s*$')
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
            elseif(max_len < 25)
                let name = printf('%-25s', name)
            else
                let name = printf('%-30s', name)
            endif

            if (io == "")
                let io = ""
            else
                let io = printf('    %-8s', io)
            endif
            "echo line_comp
            let line_out_pre  = printf(' %-6s %-7s %-s %1s %-s', regw, width, name, comma, other)
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
          "  "�ο�������match matchlist subtitute
                let line_comp = matchlist(line_str,'\(\s*\)assign\s+\(\w\S*\)\s*\(=\|<=\)\s*\(\w\S*\)\s*;\s*\(.*\)')
               "let line_comp = matchlist(line_str,'^\s*assign\s+\(\w.*\)\s*\(=\|<=\)\s*\(\w.*\)\s*;\s*\(.*\)')
               "echo line_comp
                let indent_s     = get(line_comp, 1)
                let name_left    = get(line_comp, 2)
                let eq_s         = get(line_comp, 3)
                let name_right   = get(line_comp, 4)
                let comment      = get(line_comp, 5)
                let assign_s     = "assign"
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
          "  "�ο�������match matchlist subtitute
                let line_comp = matchlist(line_str,'\(\s*\)assign\s+\(\w\S*\)\s*\(=\|<=\)\s*\(\w\S*\)\s*;\s*\(.*\)')
               "let line_comp = matchlist(line_str,'^\s*assign\s+\(\w.*\)\s*\(=\|<=\)\s*\(\w.*\)\s*;\s*\(.*\)')
               "echo line_comp
                let indent_s     = get(line_comp, 1)
                let name_left    = get(line_comp, 2)
                let eq_s         = get(line_comp, 3)
                let name_right   = get(line_comp, 4)
                let comment      = get(line_comp, 5)
                let assign_s     = "assign"
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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"���а�Ȩ����������
"��ӻ����ͷ
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F4> :call TitleDet()<cr>'s
function AddTitle()
    call append(0,"/*========================================================= ")
    call append(1,"author : Micro")
    call append(2,"version :  #0.01 as first version ")
    call append(3,"modify engineer &��date : " .strftime("%y-%m-%d  %H:%M"))
    call append(4,"filename : " .expand("%:t"))
    call append(5,"function describe : " )
    call append(6,"==========================================================*/")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endf
"��������޸�ʱ����ļ���
function UpdateTitle()
     "��ǵ�ǰ��λ�ã�normal��ʾ��normal״̬�µ�����
    normal m' 
    execute '/# *Last modified:/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'
    "���ر��λ��
    normal '' 
    normal mk
    execute '/# *Filename:/s@:.*$@\=":\t\t".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction
"�ж�ǰ10�д������棬�Ƿ���Last modified������ʣ�
"���û�еĻ�������û����ӹ�������Ϣ����Ҫ����ӣ�
"����еĻ�����ôֻ��Ҫ���¼���
function TitleDet()
    let n=1
    "Ĭ��Ϊ���
    while n < 7
        let line = getline(n)
        "let line = getline(.)  " . ��ʾ��������У���ǰ��
        if line =~ '^\#\s*\S*Last\smodified:\S*.*$'
            call UpdateTitle()
            return
        endif
        let n = n + 1
    endwhile
    call AddTitle()
endfunction

"comment for perl plugin must use the fixed version
""function! Align_inst() 
""    let line_start=line("'<")
""    let line_end=line("'>")
""    perl Align(line_start, line_end)
""endfunction
"""///"EOF"����������(ǰ�治����ǰ���ո�)
""perl << EOF
""sub align_inst{
""\\  ($success_1,$line_begin) = VIM::Eval('line("'<")');
""\\  ($success_2,$line_end)   = VIM::Eval('line("'>")');
""    $line_begin = $_[0];
""    $line_end   = $_[1];
""    @lines = $curbuf->Get($line_begin .. $line_end); 
""    @lines_out=[];
""    $len_inst_max = 0;
""    $len_con_max  = 0;
""    foreach $line in @lines{
""        if($line =~ m/\s*\.(?<inst_wire>\w+)\(?<con_wire>\w+\).*/){
""            $len_inst = len($inst_wire)    
""            if($len_inst > $len_inst_max){
""                $len_inst_max = $len_inst;
""            }
""            
""            if($len_con > $len_con_max){
""                $len_con_max = $len_con;
""            }
""        }   
""    }
""    
""    $len_inst_out = $len_inst_max + 1;
""    $len_con_out = $len_con_max + 1;
""    foreach $line in @lines{
""        if($line =~ m/\s*\.(?<inst_wire>\w+)\(?<con_wire>\w+\),(?<other>.*)/){
""            $line_out_inst = sprintf("%*s",$len_inst_out,$inst_wire);
""            $line_out_con  = sprintf("%*s",$len_con_out,$con_wire);
""        }   
""        $line_out = "    ." .. $line_out_inst .. "(" .. $line_out_con .. ")," .. $other;
""        push @lines_out, $line_out;
""    }
""    
""    $curbuf->Delete($line_begin, $line_end); 
""    $curbuf->Set($line_begin, @lines_out); 
""}
""EOF

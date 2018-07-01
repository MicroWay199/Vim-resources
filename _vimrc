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

function! Test() 
    let a=line(".")
perl << EOF
       print (a);
       print (b);
EOF
endfunction
"///"EOF"����������(ǰ�治����ǰ���ո�)

"function! WhitePearl()
"perl << EOF
"	VIM::Msg("pearls are nice for necklaces");
"	VIM::Msg("rubys for rings");
"	VIM::Msg("pythons for bags");
"	VIM::Msg("tcls????");
"EOF
"endfunction

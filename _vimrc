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
"插件列表
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
map Q gq  "重新映射格式化快捷键，现在默认Q gq都可以
"tab  相关设置
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
""map执行shell命令
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
"基本设定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""set nu " 行号 
"set relativenumber "相对行号
set mouse=a  "双击选中bar或者tags等，双击有效
set noerrorbells  " 不让vim发出讨厌的滴滴声
set gcr=a:blinkon0 "取消光标闪烁
" 我的状态行显示的内容（包括文件类型和解码）
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]    "显示文件名: 总行数, 总的字符数
set ruler
set magic
colorscheme molokai"设置主题 
set cc=80 "hight 80th column  cc means colorcolumn also set corlorcolumn=80 work
set cursorline "高亮显示当前行
""can set several options operately
"hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"" s使用autocmd来解决和colorshceme设定之间的冲突
autocmd BufRead,BufNew * hi CursorLine guibg=black 
set cursorcolumn  "高亮显示当前列
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
autocmd BufRead,BufNew * hi CursorColumn guibg=black 
set nobackup                 " 设置无备份文件
"printf函数返回格式化字符串
set backupdir=printf("%s,%s",getcmd()，"/vi_backup/")
set noswapfile 
set noundofile 
let autosave = 300 "每300s自动保存一次"
"let as = 300  "as  就是autosave的意思
set showmatch               "代码匹配
set laststatus=2            "总是显示状态行
set autoread                "文件在Vim之外修改过，自动重新读入
syntax enable
syntax on
set ai                      "自动缩进
set autoindent               " 自动缩进对齐
set smartindent
set autochdir            "自动设置当前目录为正在编辑的目录
set backspace=2            "设置退格键可用
set clipboard+=unnamed   " 与windows共享剪贴板
set guifont=Consolas:h12
"set guifont=Courier\ New:h11   "\ 为转义字符  转义空格
autocmd GUIEnter * simalt ~x "windows下启动之后默认最大化
set guioptions=+m   "显示菜单栏，如果不设置则都显示
"set guioptions=+T   "显示工具栏,guioptions如果设置了则只能赋一个值，

set scrolloff=3   "设置光标所在位置最高和最低到边界行数为3
set incsearch
set autoindent               " 自动对齐
set softtabstop=2 "set tab = insertspace
"缩进宽度为4个字符"  
set shiftwidth=4  
"tab宽度为4个字符"  
"set tabstop=4  
""编辑时将所有tab替换为空格"  
set et  
set expandtab                " 将Tab自动转化成空格[需要输入真正的Tab键时，使用 Ctrl+V + Tab]
"set ft = c   "filetype设定
"
syntax enable                " 打开语法高亮
syntax on                    " 开启文件类型侦测
filetype indent on           " 针对不同的文件类型采用不同的缩进格式
filetype plugin on           " 针对不同的文件类型加载对应的插件
filetype plugin indent on    " 启用自动补全

" 映射切换buffer的键位
"光标离文本框上下至少三行
set scrolloff=3
set nowrap 
set autochdir  "自动跳转到当前文件目录
source $VIMRUNTIME/macros/matchit.vim 
"if not work well,use autocmd BufNweFile,BufRead *   let b:match_wrods 
let b:match_wrods='\<begin\>:\<end\>'
                  \ .  '\<module\>:\<endmodule\>' 
                  \ .  '\<case\>:\<endcase\>' "can added any pairs like this 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"进行版权声明的设置
"添加或更新头
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F4> :call TitleDet()<cr>'s
function AddTitle()
    call append(0,"/*========================================================= ")
    call append(1,"author : Micro")
    call append(2,"version :  #0.01 as first version ")
    call append(3,"modify engineer &　date : " .strftime("%y-%m-%d  %H:%M"))
    call append(4,"filename : " .expand("%:t"))
    call append(5,"function describe : " )
    call append(6,"==========================================================*/")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endf
"更新最近修改时间和文件名
function UpdateTitle()
     "标记当前按位置，normal表示是normal状态下的命令
    normal m' 
    execute '/# *Last modified:/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'
    "跳回标记位置
    normal '' 
    normal mk
    execute '/# *Filename:/s@:.*$@\=":\t\t".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction
"判断前10行代码里面，是否有Last modified这个单词，
"如果没有的话，代表没有添加过作者信息，需要新添加；
"如果有的话，那么只需要更新即可
function TitleDet()
    let n=1
    "默认为添加
    while n < 7
        let line = getline(n)
        "let line = getline(.)  " . 表示光标所在行，当前行
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
"///"EOF"必须在行首(前面不能有前导空格)

"function! WhitePearl()
"perl << EOF
"	VIM::Msg("pearls are nice for necklaces");
"	VIM::Msg("rubys for rings");
"	VIM::Msg("pythons for bags");
"	VIM::Msg("tcls????");
"EOF
"endfunction

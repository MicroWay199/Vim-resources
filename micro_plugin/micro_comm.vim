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
set cursorcolumn  "������ʾ��ǰ��
""can set several options operately
"hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"" sʹ��autocmd�������colorshceme�趨֮��ĳ�ͻ
autocmd BufRead,BufNew * hi CursorLine guibg=black 
autocmd BufRead,BufNew * hi CursorColumn guibg=black 
set nobackup                 " �����ޱ����ļ�
"printf�������ظ�ʽ���ַ���
set backupdir=printf("%s,%s",getcmd()��"/vi_backup/")
set noswapfile 
set noundofile 
let autosave = 300 "ÿ300s�Զ�����һ��" "let as = 300  "as  ����autosave����˼
set showmatch               "����ƥ��
set laststatus=2            "������ʾ״̬��
set autoread                "�ļ���Vim֮���޸Ĺ����Զ����¶���
syntax enable
syntax on
set ai                      "�Զ�����
set autoindent              " �Զ���������
set smartindent
set autochdir               "�Զ����õ�ǰĿ¼Ϊ���ڱ༭��Ŀ¼
set backspace=2             "�����˸������
set clipboard+=unnamed      " ��windows���������
set guifont=Consolas:h12
"set guifont=Courier\ New:h11   "\ Ϊת���ַ�  ת��ո�
"autocmd GUIEnter * simalt ~x   "windows������֮��Ĭ�����
set guioptions=+m               "��ʾ�˵������������������ʾ
"set guioptions=+T              "��ʾ������,guioptions�����������ֻ�ܸ�һ��ֵ��

set scrolloff=3                 "���ù������λ����ߺ���͵��߽�����Ϊ3
set incsearch
set autoindent                  " �Զ�����
set softtabstop=4               "set tab = insertspace "�������Ϊ4���ַ�"  
set shiftwidth=4                "tab���Ϊ4���ַ�"  
"set tabstop=4  
""�༭ʱ������tab�滻Ϊ�ո�"  
set et  
set expandtab                   " ��Tab�Զ�ת���ɿո�[��Ҫ����������Tab��ʱ��ʹ�� Ctrl+V + Tab]
"set ft = c                     "filetype�趨
"
syntax enable                " ���﷨����
syntax on                    " �����ļ��������
filetype indent on           " ��Բ�ͬ���ļ����Ͳ��ò�ͬ��������ʽ
filetype plugin on           " ��Բ�ͬ���ļ����ͼ��ض�Ӧ�Ĳ��
filetype plugin indent on    " �����Զ���ȫ



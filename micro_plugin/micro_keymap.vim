"==================================================================
"""""" map keys  use :h map for more information
"==================================================================
let mapleader="\<space>"
inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>
inoremap begin begin<cr><cr>end<up>
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
map Q gq  "重新映射格式化快捷键，现在默认Q gq都可以
"tab bar 相关设置
map <tab> :tabn<CR>
map <s-tab> :tabp<CR>
map n<tab> :tabnew



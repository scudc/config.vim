">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
">>>>vim自身相关配置


if has("win32")
    set runtimepath=$VIM,C:/Program\ Files/Vim/vim73,C:/Program\ Files/Vim/vimfiles
endif

"启动时窗口最大化
function! MaximizeWindow()
    silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction
if has('win32')
    au GUIEnter * simalt ~x
else
    au GUIEnter * call MaximizeWindow()
endif

"记住上次编辑位置
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \ exe "normal g`\"" |
     \ endif

"定义快捷键的前缀，即<Leader>
let mapleader=";"

if has("win32")
    map <silent> <leader>ss :source $HOME/_vimrc<cr>
    map <silent> <leader>ee :e $HOME/_vimrc<cr>
else
    "快速重新加载vimrc配置的快捷键
    map <silent> <leader>ss :source $HOME/.vimrc<cr>
    "快速编辑vimrc快捷键
    map <silent> <leader>ee :e $HOME/.vimrc<cr>
endif



"设置编码
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,gb18030,gb2312,gbk,cp936
"去掉bom标记
set nobomb

"设置gvim无菜单栏与工具栏
set guioptions-=m
set guioptions-=T

" history文件中需要记录的行数
set history=500

" 在处理未保存或只读文件的时候，弹出确认
set confirm

"在windows时编码设置
if has("win32")
    set termencoding=utf-8
    set langmenu=zh_CN.utf-8
    language messages zh_cn.utf-8
    language messages zh_cn.utf-8
endif


"用于语法高亮的配色方案
colorscheme Dark2

"禁止光标闪烁
"set gcr=a:block-blinkon0


"开启语法高亮功能
syntax enable
"允许用指定语法高亮配色方案替换默认方案
syntax on

"设置制表符占用空格数
set expandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4
set wrap

"设置非可见字符的显示
set list
set listchars=tab:>-,trail:^

"开启行号显示
set number

" 自动格式化
set formatoptions=tcrqn

" 继承前一行的缩进方式，特别适用于多行注释
set autoindent

" 为C程序提供自动缩进
set smartindent

"开启高亮显示结果
set hlsearch

"开启实时搜索功能
set incsearch

"智能搜索,全是小写时不区分大小写，有一个大写则区分大小写
set ignorecase smartcase

"在命令行显示当前输入的命令
set showcmd

" 总是显示状态行
set laststatus=1

"禁止折行
"set nowrap

"关闭兼容模式
set nocompatible

"解决方向键不能用的问题
"set t_ku=OA
"set t_kd=OB
"set t_kl=OD
"set t_kr=OC

"禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

"开启文件类型侦测
filetype on
"根据侦测到的不同类型加载对应的插件
filetype plugin on
"根据侦测到的不同类型采用不同的缩进格式
filetype indent on


"定义快捷键到行首和行尾
"nmap lh 0
"nmap le $

"定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>

"定义快捷键保持当前窗口内容
nmap <Leader>w :w<CR>

"设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
"设置快捷键将系统剪贴板内容粘贴至vim
nmap <Leader>p "+p

" 不要备份文件（根据自己需要取舍）
set nobackup


" 增强模式中的命令行自动完成操作
set wildmenu

" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=2

" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2

" 启动的时候不显示那个援助索马里儿童的提示
set shortmess=atI

"VIM支持多种文本折叠方式，我VIM多用于编码，所以选择符合编程语言语法的代码折叠方式。
set foldmethod=indent
"启动vim时打开所有折叠代码。foldlevel用于设置闭合折叠代码的层级
set foldlevel=100













">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
">>>>插件相关配置



"<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< NERDtree <<<<<<<<<<<<<<<<<<<<<<<<<
"使用NERDTree插件查看工程文件。设置快捷键，速记：filelist
nmap <Leader>fl :NERDTreeToggle<CR>
"设置NERDTree子窗口宽度
let NERDTreeWinSize=45
"设置NERDTree子窗口位置
let NERDTreeWinPos="right"
"设置当打开文件后自动关闭NERDtree窗口
let NERDTreeQuitOnOpen=1


"<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< acp <<<<<<<<<<<<<<<<<<<<<<<<<
"用于自动补全函数
au FileType php setlocal dict+=$HOME/vimextrafiles/php_funclist.dict







""<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< taglist <<<<<<<<<<<<<<<<<<<<<<<<
"设置tablist插件只显示当前编辑文件的tag内容，而非当前所有打开文件的tag内容
let Tlist_Show_One_File=1
"设置显示标签列表子窗口的快捷键。速记：taglist
nnoremap <Leader>tl :TlistToggle<CR>
"设置标签子窗口的宽度
let Tlist_WinWidth=45
"标签列表窗口显示或隐藏不影响整个gvim窗口大小
let Tlist_Inc_Winwidth=0
"减少空行显示
let Tlist_Compact_Format=1
"不显示折叠行
let Tlist_Enable_Fold_Column=0
"当只剩taglist窗口时，关闭vim
let Tlist_Exit_OnlyWindow = 1
"打开taglist窗口时，光标也进入到taglist窗口中
let Tlist_GainFocus_On_ToggleOpen = 1
"当选中一标签后，关闭taglist窗口
let Tlist_Close_On_Select = 1
"设置php文件显示
let tlist_php_settings='php;c:class;d:constant definitions;f:functions'






""<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< new-omni-completion <<<<<<<<<<<<<<<<<<<<<<<<
""取消补全内容以分割子窗口形式出现，只显示补全列表
"set completeopt=longest,menu
""使用new-omni-completion插件智能补全代码。该插件默认使用CTRL-XCTRL-O补全函数名或变量名，自定义快捷键为TAB
"imap <Leader><TAB> <C-X><C-O>








""<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< doxygenToolkit <<<<<<<<<<<<<<<<<<<<<<<<
""使用///风格
let g:DoxygenToolkit_commentType="Shell"
" plugin - NERD_commenter.vim   注释代码用的，
" [count],cc 光标以下count行逐行添加注释(7,cc)
" [count],cu 光标以下count行逐行取消注释(7,cu)
" [count],cm 光标以下count行尝试添加块注释(7,cm)
" ,cA 在行尾插入 /* */,并且进入插入模式。 这个命令方便写注释。
" 注：count参数可选，无则默认为选中行或当前行
"-----------------------------------------------------------------
let NERDSpaceDelims=1       " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=1   " 多行注释时样子更好看


"-----------------------------------------------------------------
" plugin - DoxygenToolkit.vim  由注释生成文档，并且能够快速生成函数标准注释
"-----------------------------------------------------------------
let g:DoxygenToolkit_authorName="hobodong in TENCENT"
let g:DoxygenToolkit_briefTag_funcName="yes"
map <leader>da :DoxAuthor<CR>
map <leader>df :Dox<CR>
map <leader>db :DoxBlock<CR>
map <leader>dc a ##  #<LEFT><LEFT><LEFT>



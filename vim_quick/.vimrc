set encoding=utf-8

let mapleader = ";"

" tab 和缩进
set tabstop=4
set softtabstop=4
set smarttab

set shiftwidth=4
set cindent

" 历史和撤销
set history=50		" keep 50 lines of command line history
inoremap <C-U> <C-G>u<C-U>

" 显示未完成的命令
set showcmd		" display incomplete commands

" 回到上次编辑位置
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" 高亮当前行和列，只高亮活动窗口
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
"    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
"    autocmd WinLeave * setlocal nocursorcolumn
augroup END

" 搜索
set incsearch		" 增量搜索
set hlsearch        " 高亮搜索

" 拼写检查
" set spell

" 行号
set nu!

" 换行与折行
" set textwidth=70
set nowrap

" 80 行 显示竖线
set colorcolumn=80

" 代码折叠 zc, zo
set foldmethod=indent
set foldlevelstart=99
set foldignore=

" 粘贴模式
:set pastetoggle=<Leader>p

" 黑洞寄存器
noremap <S-x> "_d

" 后台时自动保存
noremap <C-z> :wa<CR><C-z>

" 跳着移动
noremap <C-j> 5j
noremap <C-k> 5k

" 切换窗口
noremap <Tab> <C-w>w

" 删除到下一行
noremap dJ d$Jx

" a 选择时不包括前面的空格
vnoremap a' 2i'
vnoremap a" 2i"
vnoremap a` 2i`
onoremap a' 2i'
onoremap a" 2i"
onoremap a` 2i`

" 去掉有关vi一致性模式，避免以前版本的bug和局限
set nocompatible

" Vundle
" :BundleList     //会显示你vimrc里面填写的所有插件名称
" :BundleInstall  //会自动下载安装或更新你的插件。
" :BundleClean    //清理不使用的插件
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Bundle 'gmarik/Vundle.vim'

" 开启目录树导航
Bundle 'scrooloose/nerdtree.git'
map <Leader>n :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeIgnore = ['\.pyc']

" 括号匹配
Bundle 'jiangmiao/auto-pairs.git'
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<C-b>'

" python 自动缩进
Bundle 'hynek/vim-python-pep8-indent'

" 彩虹括号
Bundle 'kien/rainbow_parentheses.vim'
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" 配色
set t_Co=256
let g:solarized_termcolors=256
Bundle 'altercation/vim-colors-solarized.git'
set background=light
colorscheme solarized

" 状态栏美观
Bundle 'vim-airline'
set ambiwidth=single
set laststatus=2
let g:airline_exclude_preview = 1
" 显示 git 分支
Bundle 'tpope/vim-fugitive'
" putty下会乱码
let g:airline_powerline_fonts = 1
" Tab line设置
" let g:airline#extensions#tabline#enabled = 1
" map <S-tab> :bn<CR>
" map <C-h> :bp<CR>
" map <C-w> :bd<CR>

" 缩进标识
Bundle 'Yggdroot/indentLine'
let g:indentLine_color_term = 187

" 将代码行最后无效的空格标红
Bundle 'bronson/vim-trailing-whitespace'
map <Leader><Space> :FixWhitespace<CR>

" 快速移动
Bundle 'Lokaltog/vim-easymotion'
hi link EasyMotionTarget Search
hi link EasyMotionTarget2First Search
hi link EasyMotionTarget2Second Search
" hi link EasyMotionShade Comment

" 批量变量修改
Bundle 'terryma/vim-multiple-cursors'
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" 加括号
Bundle 'tpope/vim-surround'

" 拼写检查
" Bundle 'scrooloose/syntastic.git'
" let g:syntastic_python_pylint_args="-d C0103,C0111,R0903,W0141"

" 按照驼峰或下划线移动
" Bundle 'bkad/CamelCaseMotion'
" map <silent> w <Plug>CamelCaseMotion_w
" map <silent> b <Plug>CamelCaseMotion_b
" map <silent> e <Plug>CamelCaseMotion_e
" map <silent> ge <Plug>CamelCaseMotion_ge
" omap <silent> iw <Plug>CamelCaseMotion_iw
" xmap <silent> iw <Plug>CamelCaseMotion_iw
" omap <silent> ib <Plug>CamelCaseMotion_ib
" xmap <silent> ib <Plug>CamelCaseMotion_ib
" omap <silent> ie <Plug>CamelCaseMotion_ie
" xmap <silent> ie <Plug>CamelCaseMotion_ie


filetype plugin indent on

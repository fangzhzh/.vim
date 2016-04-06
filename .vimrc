set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Bundle 'rizzatti/funcoo.vim'
Bundle 'winmanager'
Bundle 'fholgado/minibufexpl.vim'
Plugin 'rizzatti/dash.vim'

" auto complete
Plugin 'Valloric/YouCompleteMe'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" dir tree
Plugin 'scrooloose/nerdtree'
" git status
Plugin 'Xuyuanp/nerdtree-git-plugin'
" global search
Plugin 'kien/ctrlp.vim'
" powerline  
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" 
Plugin 'easymotion/vim-easymotion'
" xml format
Plugin 'Chiel92/vim-autoformat'
" wakatime
Bundle 'wakatime/vim-wakatime'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


if v:lang =~ "^ko"
set fileencodings=euc-kr
set guifontset=-*-*-medium-r-normal--16-*-*-*-*-*-*-*
elseif v:lang =~ "^ja_JP"
set fileencodings=euc-jp
set guifontset=-misc-fixed-medium-r-normal--14-*-*-*-*-*-*-*
elseif v:lang =~ "^zh_TW"
set fileencodings=big5
set guifontset=-sony-fixed-medium-r-normal--16-150-75-75-c-80-iso8859-1,-taipei-fixed-medium-r-normal--16-150-75-75-c-160-big5-0
elseif v:lang =~ "^zh_CN"
set fileencodings=utf-8
set guifontset=*-r-*
elseif v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
set fileencodings=utf-8,latin1
endif
" 对语言的支持,utf8和gbk之类
set fileencodings=utf-8,gbk,big5,utf-8,latin1,euc-jp,euc-kr,ucs-bom,cp936

if &term=="xterm"
set t_Co=8
set t_Sb=^[4%dm
set t_Sf=^[3%dm
endif

" Only do this part when compiled with support for autocommands
if has("autocmd")
" In text files, always limit the width of text to 78 characters
autocmd BufRead *.txt set tw=78
" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal g'\"" |
\ endif
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
syntax enable
" if &t_Co > 2 || has("gui_running")
syntax on
"   set hlsearch
" endif

set nocompatible	" Use Vim defaults (much better!)
set bs=2		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

set number " 显示行号
set autoindent " 智能自动缩进
set smartindent " 开启新行时使用智能自动缩进
set shiftwidth=4 " 缩进所表示的空格数
set tabstop=4
set expandtab " 用空格替换tab字符
%retab
set softtabstop=4 " 使得按退格键时可以一次删掉 4 个空格
filetype plugin indent on " 让filetype-plugin根据文件类型自动缩进
set hlsearch  " 对被搜索的表达式显示高亮
set incsearch " 在输入要搜索的文字时，实时匹配

set foldenable              " 开始折叠    :help zo
set foldmethod=syntax       " 设置语法折叠
set foldcolumn=0            " 设置折叠区域的宽度
setlocal foldlevel=2        " 设置折叠层数为
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" cscope的设置
" 查看帮助     :help if_cscop.txt
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  if has("cscope")
"  	set csprg=/usr/local/bin/cscope
"  	" 优选搜索标签库，未找到匹配项后搜索cscope数据库
"  	set csto=1
"  	" vim内置命令 同时搜索cscope数据库和标签库
"  	set cst
"  	set nocsverb
"  	" add any database in current directory
"  	if filereadable("cscope.out")
"  		cs add cscope.out
"  	" else add database pointed to by environment
"  	elseif $CSCOPE_DB != ""
"  		cs add $CSCOPE_DB
"  	endif
"  	" 添加cscope.out文件 Ice BDB boost
"  	cs add ~/Ice-3.4.2/cpp/cscope.out ~/Ice-3.4.2/cpp
"  	cs add ~/Ice-3.4.2/ThirdParty/db-4.8.30.NC/cscope.out ~/Ice-3.4.2/ThirdParty/db-4.8.30.NC
"  	cs add /usr/include/boost/cscope.out /usr/include/boost/
"  	" 给出添加cscope数据库成功与否信息
"  	set csverb
"  	" 用 quickfix 窗口来显示 cscope 结果
"  	set cscopequickfix=s-,c-,d-,i-,t-,e-
"  	" cscope用的快捷键
"  	nmap <C-X>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"  	nmap <C-X>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"  	nmap <C-X>c :cs find c <C-R>=expand("<cword>")<CR><CR>
"  	nmap <C-X>t :cs find t <C-R>=expand("<cword>")<CR><CR>
"  	nmap <C-X>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"  	nmap <C-X>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"  	nmap <C-X>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
"  	nmap <C-X>d :cs find d <C-R>=expand("<cword>")<CR><CR>
"  endif   " if has("cscope")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 快捷键设置
" 	nmap 是command模式,    imap 是insert模式
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" find function list
noremap <F3> <Esc>:cnext<CR><Esc>
noremap <S-F3> <Esc>:cprevious<CR><Esc>
" F3       --- 查找
" nmap <silent> <F3> :grep<CR>
" imap <F3> <esc><F3>
" F4       --- 全部退出
nmap <F4> :qall<cr>
imap <F4> <esc><F4>
" F5       --- 全部保存
nmap <F5> :wall<cr>
imap <F5> <esc><F5>a
" F7       --- 编译项目
nmap <F7> <F5>:make<cr>
imap <F7> <esc><F7>
" F8       --- 重新编译项目
nmap <F8> :make clean<cr><F7>
imap <F8> <esc><F8>
" F9       --- 代码补全 ( insert模式 )
imap <F9> <C-X><C-O>
" F11      --- 生成当前目录的tags
"nmap <F11> <F5>:!ctags   .<CR>
imap <F11> <esc><F11>
"        --- 清除屏幕高亮
nmap <C-A> :noh<cr>
imap <C-A> <esc><C-A>a

" some extra commands for HTML editing
"  nmap ,mh wbgueyei<<ESC>ea></<ESC>pa><ESC>bba
"  nmap ,h1 _i<h1><ESC>A</h1><ESC>
"  nmap ,h2 _i<h2><ESC>A</h2><ESC>
"  nmap ,h3 _i<h3><ESC>A</h3><ESC>
"  nmap ,h4 _i<h4><ESC>A</h4><ESC>
"  nmap ,h5 _i<h5><ESC>A</h5><ESC>
"  nmap ,h6 _i<h6><ESC>A</h6><ESC>
"  nmap ,hb wbi<b><ESC>ea</b><ESC>bb
"  nmap ,he wbi<em><ESC>ea</em><ESC>bb
"  nmap ,hi wbi<i><ESC>ea</i><ESC>bb
"  nmap ,hu wbi<u><ESC>ea</i><ESC>bb
"  nmap ,hs wbi<strong><ESC>ea</strong><ESC>bb
"  nmap ,ht wbi<tt><ESC>ea</tt><ESC>bb
"  nmap ,hx wbF<df>f<df>


"""""""""""""""""""""""""""""" 
" taglist的配置
"""""""""""""""""""""""""""""" 
"""""""""""""""""""""""""""""" 
" WinManager
"""""""""""""""""""""""""""""" 
let g:winManagerWindowLayout='FileExplorer|TagList' " 设置窗口布局
let g:winManagerWidth=40
nmap <f12> :WMToggle<cr>
imap <f12> <esc><f12>a

"""""""""""""""""""""""""""""" 
" MiniBufExplorer
"""""""""""""""""""""""""""""" 
let g:miniBufExplMapWindowNavArrows = 1 " 通过方向键切换窗口 ( 这个没有发挥作用 )
let g:miniBufExplMapCTabSwitchBufs = 1  " 供过tab切换窗口 ( 这个也没有发挥作用，不知道为什么 )
let g:miniBufExplModSelTarget = 1
let g:miniBufExplMapWindowNavVim = 1    " 通过h,j,k,l切换窗口 ( l没有发挥作用: 关闭金山词霸的热键 )

"""""""""""""""""""""""""""""" 
" OmniCppComplete
"""""""""""""""""""""""""""""" 
" set nocp 
" filetype plugin on
" let OmniCpp_GlobalScopeSearch = 1
" let OmniCpp_ShowAccess = 1
" let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表
" let OmniCpp_MayCompleteDot = 1   " 输入 .  后自动补全
" let OmniCpp_MayCompleteArrow = 1 " 输入 -> 后自动补全
" let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全
" let OmniCpp_ShowScopeInAbbr = 1  " 显示匹配项所在域，并移除缩略信息中最后一列
" let OmniCpp_DefaultNamespaces = ["std","Emdp"]
" 自动关闭补全窗口
" au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
" set completeopt=menuone,menu,longest
" highlight Pmenu    guibg=darkgrey  guifg=black
" highlight PmenuSel guibg=blue guifg=white

"""""""""""""""""""""""""""""" 
" grep.vim 的配置
"""""""""""""""""""""""""""""" 
let Grep_Default_Filelist = '*.h *.hpp *.cpp *.cxx *.c *.m *.java'

"colorscheme darkblue
colorscheme desert
"colorscheme professional
"colorscheme Dark
"colorscheme shine
"colorscheme devcpp
"colorscheme wuye
"colorscheme borland
"colorscheme ron
"colorscheme blue
"colorscheme pablo
"colorscheme delek


""""""""""""""""""""""""""""""
" NERDTree 
""""""""""""""""""""""""""""""
" Ctrl+N 打开 /关闭
map <C-n> :NERDTreeToggle<CR>
" 当不带参数打开 Vim 时自动加载项目树
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" 当所有文件关闭时关闭项目树窗格
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" 不显示这些文件
let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules'] "ignore files in NERDTree
" 不显示项目树上额外的信息，例如帮助、提示什么的
""  let NERDTreeMinimalUI=1

""""""""""""""""""""""""
" ctrl p global search
""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip,*/generated/*,*/intermediates/*
let g:ctrlp_custom_ignore = {'dir':  '\v[\/]\.(git|hg|svn)$', 'file': '\v\.(exe|so|dll)$'}
 

"""""""""""""""""""""""""""""""
" Powerline
"""""""""""""""""""""""""""""""
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

" javascript mode
" https://github.com/pangloss/vim-javascript.git
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
" go syntax
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on
autocmd filetype crontab setlocal nobackup nowritebackup
autocmd fileType python setlocal autoindent noexpandtab shiftwidth=4 softtabstop=4 tabstop=4

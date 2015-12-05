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
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" 
Plugin 'easymotion/vim-easymotion'

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
" �����Ե�֧��,utf8��gbk֮��
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

set nonumber " ��ʾ�к�
set autoindent " �����Զ�����
set smartindent " ��������ʱʹ�������Զ�����
set shiftwidth=4 " ��������ʾ�Ŀո���
set tabstop=4
set expandtab " �ÿո��滻tab�ַ�
%retab
set softtabstop=4 " ʹ�ð��˸��ʱ����һ��ɾ�� 4 ���ո�
filetype plugin indent on " ��filetype-plugin�����ļ������Զ�����
set hlsearch  " �Ա������ı��ʽ��ʾ����
set incsearch " ������Ҫ����������ʱ��ʵʱƥ��

set foldenable              " ��ʼ�۵�    :help zo
set foldmethod=syntax       " �����﷨�۵�
set foldcolumn=0            " �����۵�����Ŀ��
setlocal foldlevel=2        " �����۵�����Ϊ
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" cscope������
" �鿴����     :help if_cscop.txt
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  if has("cscope")
"  	set csprg=/usr/local/bin/cscope
"  	" ��ѡ������ǩ�⣬δ�ҵ�ƥ���������cscope���ݿ�
"  	set csto=1
"  	" vim�������� ͬʱ����cscope���ݿ�ͱ�ǩ��
"  	set cst
"  	set nocsverb
"  	" add any database in current directory
"  	if filereadable("cscope.out")
"  		cs add cscope.out
"  	" else add database pointed to by environment
"  	elseif $CSCOPE_DB != ""
"  		cs add $CSCOPE_DB
"  	endif
"  	" ���cscope.out�ļ� Ice BDB boost
"  	cs add ~/Ice-3.4.2/cpp/cscope.out ~/Ice-3.4.2/cpp
"  	cs add ~/Ice-3.4.2/ThirdParty/db-4.8.30.NC/cscope.out ~/Ice-3.4.2/ThirdParty/db-4.8.30.NC
"  	cs add /usr/include/boost/cscope.out /usr/include/boost/
"  	" �������cscope���ݿ�ɹ������Ϣ
"  	set csverb
"  	" �� quickfix ��������ʾ cscope ���
"  	set cscopequickfix=s-,c-,d-,i-,t-,e-
"  	" cscope�õĿ�ݼ�
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
" ��ݼ�����
" 	nmap ��commandģʽ,    imap ��insertģʽ
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" F3       --- ����
nmap <silent> <F3> :Grep<CR>
imap <F3> <esc><F3>
" F4       --- ȫ���˳�
nmap <F4> :qall<cr>
imap <F4> <esc><F4>
" F5       --- ȫ������
nmap <F5> :wall<cr>
imap <F5> <esc><F5>a
" F7       --- ������Ŀ
nmap <F7> <F5>:make<cr>
imap <F7> <esc><F7>
" F8       --- ���±�����Ŀ
nmap <F8> :make clean<cr><F7>
imap <F8> <esc><F8>
" F9       --- ���벹ȫ ( insertģʽ )
imap <F9> <C-X><C-O>
" F11      --- ���ɵ�ǰĿ¼��tags
"nmap <F11> <F5>:!ctags   .<CR>
imap <F11> <esc><F11>
"        --- �����Ļ����
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
" taglist������
"""""""""""""""""""""""""""""" 
"""""""""""""""""""""""""""""" 
" WinManager
"""""""""""""""""""""""""""""" 
let g:winManagerWindowLayout='FileExplorer|TagList' " ���ô��ڲ���
let g:winManagerWidth=40
nmap <f12> :WMToggle<cr>
imap <f12> <esc><f12>a

"""""""""""""""""""""""""""""" 
" MiniBufExplorer
"""""""""""""""""""""""""""""" 
let g:miniBufExplMapWindowNavArrows = 1 " ͨ��������л����� ( ���û�з������� )
let g:miniBufExplMapCTabSwitchBufs = 1  " ����tab�л����� ( ���Ҳû�з������ã���֪��Ϊʲô )
let g:miniBufExplModSelTarget = 1
let g:miniBufExplMapWindowNavVim = 1    " ͨ��h,j,k,l�л����� ( lû�з�������: �رս�ɽ�ʰԵ��ȼ� )

"""""""""""""""""""""""""""""" 
" OmniCppComplete
"""""""""""""""""""""""""""""" 
" set nocp 
" filetype plugin on
" let OmniCpp_GlobalScopeSearch = 1
" let OmniCpp_ShowAccess = 1
" let OmniCpp_ShowPrototypeInAbbr = 1 " ��ʾ���������б�
" let OmniCpp_MayCompleteDot = 1   " ���� .  ���Զ���ȫ
" let OmniCpp_MayCompleteArrow = 1 " ���� -> ���Զ���ȫ
" let OmniCpp_MayCompleteScope = 1 " ���� :: ���Զ���ȫ
" let OmniCpp_ShowScopeInAbbr = 1  " ��ʾƥ���������򣬲��Ƴ�������Ϣ�����һ��
" let OmniCpp_DefaultNamespaces = ["std","Emdp"]
" �Զ��رղ�ȫ����
" au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
" set completeopt=menuone,menu,longest
" highlight Pmenu    guibg=darkgrey  guifg=black
" highlight PmenuSel guibg=blue guifg=white

"""""""""""""""""""""""""""""" 
" grep.vim ������
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
" Ctrl+N �� /�ر�
map <C-n> :NERDTreeToggle<CR>
" ������������ Vim ʱ�Զ�������Ŀ��
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" �������ļ��ر�ʱ�ر���Ŀ������
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" ����ʾ��Щ�ļ�
let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules'] "ignore files in NERDTree
" ����ʾ��Ŀ���϶������Ϣ�������������ʾʲô��
let NERDTreeMinimalUI=1

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


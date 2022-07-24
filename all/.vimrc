" 背景: 4种模式
"       正常模式，插入模式，命令模式，可视模式
" 目录: 2部分
"       快捷键，vim基本配置和插件配置


" ----------------------------------------------------------------
" ------------------------ 下面是快捷键 --------------------------
" ----------------------------------------------------------------
" <F1> <F2> <F3> <F4> 编译运行相关
" 编译工程
nnoremap <F2> :wa<CR> :!cba<CR>
" 运行重启
"nnoremap <F3> :wa<CR> :!uess<cr>
nnoremap <F3> :!python %<cr>
" 编译单个c++文件; 编译python :!python %
nnoremap <F4> :!g++ -o %< -g -fpermissive -std=c++0x % && ./%< <cr>

" <F5> <F6> <F7> <F8> 查阅代码相关
nnoremap <silent> <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ --links=no .<CR><CR><CR>:call UpdateCtags() <CR>
nnoremap <silent> <F6> :!csrbq<CR><CR><CR> :cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
nnoremap <silent> <F8> :!clang-format-9 -style=file -i % .<CR> :e<cr>

" <F9> <F10> <F11> <F12> 窗口类
nnoremap <silent> <F9> :UndotreeToggle<cr>   " undotree
nnoremap <silent> <F10> :NERDTree<cr>
nnoremap <silent> <F11> :WMToggle<cr>        " window manager
nnoremap <silent> <F12> :BufExplorer<cr>

" shortcut
" 其他的快捷键风格<可以使用map[imap,nmap,vmap,map], ab等执行vim内部命令, 或者!+可执行指令扩充vim能力>
" 1、逗号加命令<5个字符> 如:,ctags 
" 2、ctrl+1个字符 如:<C-f>  向下翻页
" 3、shift+1个字符 如:<S-f>  高亮所有单词
" 4、alt+1个字符 如:<A-f>  高亮所有单词
" 5、ctrl、alt、shift任意组合 
" 6、纯字符组合 如:ab rvsp    bel vsp


" ----------------------------------------------------------------
" ----------- 下面是vim基本配置和插件的配置  ---------------------
" ----------------------------------------------------------------
" -- ctags
nnoremap <silent> ,ctags :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" -- taglist
let Tlist_Auto_Open=0
"let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Show_Menu=1
let Tlist_Use_Right_Window=0
let Tlist_Process_File_Always=1
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
nnoremap <silent> ,tlit :TlistToggle <CR>

" ctags 和 taglist 自动更新
function! UpdateCtags()
		let curdir=getcwd()
		while !filereadable("./tags")
				cd ..
				if getcwd() == "/"
						break
				endif
		endwhile
		if filewritable("./tags")
				!ctags -R --file-scope=yes --langmap=c:+.h --languages=c,c++ --links=yes --c-kinds=+p --c++-kinds=+p --fields=+iaS --extra=+q
				TlistUpdate
		endif
		execute ":cd " . curdir
endfunction
"autocmd BufWritePost *.c,*.h,*.cpp,*.cc,*.hpp call UpdateCtags()

" tag navigation
" Ctrl+]        - go to definition
" Ctrl+T        - Jump back from the definition.
" Ctrl+W Ctrl+] - Open the definition in a horizontal split
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" -- bufexplorer
" nnoremap <silent> <F12> :BufExplorer<cr>

" -- cscope
"-- Cscope setting --
if has("cscope")
    set csprg=/usr/bin/cscope " 指定用来执行cscope的命令
    set csto=0 " 设置cstag命令查找次序：0先找cscope数据库再找标签文件；1先找标签文件再找cscope数据库
    set cst " 同时搜索cscope数据库和标签文件
    set cscopequickfix=s-,c-,d-,i-,t-,e- " 使用QuickFix窗口来显示cscope查找结果
    set nocsverb
    "if filereadable("cscope.out") " 若当前目录下存在cscope数据库，添加该数据库到vim
    "    cs add cscope.out
    "elseif $CSCOPE_DB != "" " 否则只要环境变量CSCOPE_DB不为空，则添加其指定的数据库到vim
    "    cs add $CSCOPE_DB
    "endif
    "set csverb
endif
" 将:cs find c等Cscope查找命令映射为<C-_>c等快捷键（按法是先按Ctrl+Shift+-, 然后很快再按下c）
" :topleft copen  顶部打开Quickfix List
" :botright copen 底部打开Quickfix List
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR> :botright copen<CR><CR> 
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR> :copen<CR><CR>


" -- nerdTree
"nnoremap <silent> <F10> :NERDTree<cr>
" 显示行号 
let NERDTreeShowLineNumbers=1 
let NERDTreeAutoCenter=1 " 是否显示隐藏文件 
let NERDTreeShowHidden=1 " 设置宽度 
let NERDTreeWinSize=20 " 在终端启动vim时，共享NERDTree 
let g:nerdtree_tabs_open_on_console_startup=1 " 忽略一下文件的显示 
let NERDTreeIgnore=['\.pyc','\~$','\.swp'] " 显示书签列表 
let NERDTreeShowBookmarks=1
let g:NERDTreeIndicatorMapCustom = { 
      \ "Modified" : "✹", 
      \ "Staged" : "✚", 
      \ "Untracked" : "✭", 
      \ "Renamed" : "➜", 
      \ "Unmerged" : "═", 
      \ "Deleted" : "✖", 
      \ "Dirty" : "✗", 
      \ "Clean" : "✔︎", 
      \ "Unknown" : "?" 
      \ }
" let g:NERDTreeShowIgnoredStatus = 1

" -- omniCppComplete
set completeopt=longest,menu
let OmniCpp_MayCompleteDot=1    "打开  . 操作符
let OmniCpp_MayCompleteArrow=1  "打开 -> 操作符
let OmniCpp_MayCompleteScope=1  "打开 :: 操作符
let OmniCpp_NamespaceSearch=1   "打开命名空间
" 开启CSS
set omnifunc=csscomplete#CompleteCSS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" 开启HTML
set omnifunc=htmlcomplete#CompleteTags
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags 


" -- window manager F11
" let g:winManagerWindowLayout = "BufExplorer,FileExplorer|TagList"
let g:winManagerWindowLayout = "TagList"
let g:winManagerWidth = 20
"let g:AutoOpenWinManager = 1
"自动退出Winmanager
" autocmd bufenter * if (winnr("$") == 3)  | qa | endif

" -- Indent Guilde
let g:indent_guides_guide_size=1 " 对齐线宽度
map ,ch :call SetColorColumn()<CR>
function! SetColorColumn()
    let col_num = virtcol(".")
    let cc_list = split(&cc, ',')
    if count(cc_list, string(col_num)) <= 0
        execute "set cc+=".col_num
    else
        execute "set cc-=".col_num
    endif
endfunction

" vim-pathogen
execute pathogen#infect()

"nnoremap <F8> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
"nnoremap <F8> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>
" 使用u, <ctrl-r>, g+, g- as well as the :earlier and :later commands.
" 下面退出编辑文件，也可以回退操作
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

" -- vi
" normal mode:
"   q:       // open list of command history
"   q/       // open list of words u searched
"   ,spa     // set paste in command mode.  pls check <shortcut>
" command mode:
"   : or /   // could enter command mode 
"   :%       // in the whole file
"   :'<,'>   // in the zone u choose, equal to first line to end line
" visual mode:
"   v or V could enter visual mode 
" insert mode: 
"   i(insert at current char)
"   I(insert at the first char of first word in line)
"   a(append at next char)
"   A(append at the last char of last word in line)
"   o(insert in next line)
"   O(insert in preview line)
"   s(delete current char and insert at current char)
"   S(empty current line and insert at the first byte in line)
"   r(replace current char and only one)
"   R(replace char from current char)
" leave vim temp: 
"   :!command        // run command in shell
"   :terminal        // open terminal by split windows, ctrl+d back to vim
"   :!sh             // leave vim to run shell
"   :4,6!sort        // sort line 4, 5, 6 in file
" comprex key: 
"   ctrl+{one character} e.g <C-f>  next page
"   shift+{one character} e.g <S-f>  highlight all the same words 
"   alt+{one character} e.g <A-f>  highlight all the same words
"   ctrl+{shift+-}+{one character} e.g <C-_>c  // _:shift+-
" move: 
"   w // next word  
"   b // preview word
"   e // last char on next word
"   ^ // jump to first word on line
"   $ // jump to last word on line
"   0 // jump to first byte on line
"   H // jump to first line on current page
"   M // jump to middle line on current page
"   L // jump to end line on current page
"   G // jump to end line on file
"   gg // jump to first line on file
"   6gg              // jump to line 6
"   6{space key}     // move 6 char to right
"   ctrl+u or ctrl+f // next page
"   ctrl+d or ctrl+b // last page 
"   %    // switch cursor within pair symbols () [] {}
" choose zone:
"   vi"  // choose adf within double quotes \"adf\"
"   vi(  // choose adf within brackets (adf)
"   vi<  // choose adf within angle brackets <adf>
"   va"  // choose \"adf\" with double quotes \"adf\"
"   va(  // choose (adf) with brackets (adf)
"   va<  // choose <adf> with angle brackets <adf>
"   vi{  // choose zone between {}
"   va{  // choose zone between {} and {}
"   \s*$ // zone from blank to line end. /**  \s is blank, $ is line end  **/
"   \s.$ // zone from blank(at least one blank) to line end.
"   \s*s // zone from blank to char 's'
"   ^\s* // zone from line begin to continue blank
" modify: 
"   cw == dw + i // modify one word
"   ce == dw + i // modify one word
" delete: 
"   v + d or x // delete zone u choose
"   V + d or x // delete all line u choose
"   caW        // delete between the nearest blank and one blank
"   ciW        // delete between the nearest blank
" copy and paste:
"   yyp    // copy one line and paste on next line
" creating macro:
"   q in normal mode and then insert macro name(one char), then input command{}, last
"   input key <Ese> and q to end the macro defination
"   @{macro name} to call the macro
" 语法高亮
syntax on
set nocp
" comment add and delete
au BufNewFile,BufRead *.c,*.cpp,*.h,*.hpp,*.cc
\ map = ^i// |
\ map - ^xx
" python 代码缩进
au BufNewFile,BufRead *.py
\ map = ^i#  |
\ map - ^xx
" save file
nnoremap <silent> ,w :wa<cr>
" cursor stay between pair symbols
imap () ()<Left>
imap [] []<Left>
imap {} {}<Left>
imap "" ""<Left>
imap " "<Left>
" 退格键将字段缩进的删掉
set backspace=indent,eol,start
"set vb         " 关闭声音 "iunmap <BS>
"iunmap  
set t_kb=
set t_kD=[3~
"imap   
"imap  <Left><Del>
"imap  <Left><Del>
"func Backspace()
"  if col('.') == 1
"    if line('.')  != 1
"      return  "\<ESC>kA\<Del>"
"    else
"      return ""
"    endif
"  else
"    return "\<Left>\<Del>"
"  endif
"endfunc
"inoremap <BS> <c-r>=Backspace()<CR>
" 光标停在上次离开处
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
set incsearch  " 显示查找匹配结果
set hlsearch   " 查找高亮
set cursorline " 光标行高亮
"set cursorcolumn " 光标列高亮
highlight CursorLine guibg=lightblue guifg=black ctermbg=lightgray ctermfg=black
highlight CursorColumn guibg=lightblue ctermbg=lightgray guifg=black ctermfg=black
"set ignorecase " 忽略大小写
set tabstop=4  " tab为4个空格
"set laststatus=2  " 编辑模式下显示文件名
set expandtab
"set autoindent " 自动缩进
set noai nosi " 取消自动缩进和智能缩进
set shiftwidth=4
set softtabstop=4
filetype plugin indent on " 自动补全
" 粘贴格式不变
nnoremap <silent> ,spa :set paste<cr>
" 恢复缩进
nnoremap <silent> ,snpa :set nopaste<cr>
set nu
" 一行超过80个字符背景就变成红色
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929 
" cc: colorcolumn
set cc=80
" 鼠标控制窗口<拖选字符串,y复制,鼠标中键粘贴>
"     参考：http://www.cnblogs.com/centimeter/archive/2012/03/14/2395427.html
" set mouse=a
" 修改备注颜色
" highlight Comment ctermfg=green guifg=green
" 颜色方案
if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme desert
"colorscheme space-vim-dark
"colorscheme solarized
" tab之间切换
nnoremap tk             :tabnew<cr>
"cancel currenct
nnoremap tc             :tabc<cr>
"cancel others nnoremap to             :tabo<cr>
nnoremap ttn            :tabnext<Space>
nnoremap tm             :tabnext<cr>
nnoremap tn             :tabprev<cr>
nnoremap tp             :tabm<Space>
nnoremap tl             :tablast<CR>
nnoremap tf             :tabfirst<CR>
map <M-1> 1gt
map <M-2> 2gt
map <M-3> 3gt
map <M-4> 4gt
map <M-5> 5gt
map <M-6> 6gt
map <M-7> 7gt
map <M-8> 8gt
map <M-9> 9gt
map <M-0> :tablast<CR>
function MyTabLine()
    let s = ''
    let wn = ''
    let t = tabpagenr()
    let i = 1 
    while i <= tabpagenr('$')
        let buflist = tabpagebuflist(i)
        let winnr = tabpagewinnr(i)
        let s .= '%' . i . 'T' 
        let s .= (i == t ? '%1*' : '%2*')
        let s .= ' ' 
        let wn = tabpagewinnr(i,'$')

        let s .= '%#TabNum#'
        let s .= i
        let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
        let bufnr = buflist[winnr - 1]
        let file = bufname(bufnr)
        let buftype = getbufvar(bufnr, 'buftype')
        if buftype == 'nofile'
            if file =~ '\/.'
                let file = substitute(file, '.*\/\ze.', '', '') 
            endif
        else
            let file = fnamemodify(file, ':p:t')
        endif
        if file == ''
            let file = '[No Name]'
        endif
        let s .= ' ' . file . ' ' 
        let i = i + 1 
    endwhile
    let s .= '%T%#TabLineFill#%='
    let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
    return s
endfunction
set stal=2
set tabline=%!MyTabLine()
set showtabline=1
highlight link TabNum Special
" clipboard
" 略
" 文件间切换
" nnoremap <silent> <C-A-p> :bp<CR>
" nnoremap <silent> <C-A-n> :bn<CR>
autocmd VimLeave * call system("xsel -ib", getreg('+'))
"set clipboard+=unnamed 
set clipboard=exclude:.*
" 折叠代码
set foldmethod=syntax
"打开文件是默认不折叠代码
set foldlevelstart=99
" 向右垂直分屏 :bel vsp OR :rightb vsp
:ab rvsp bel vsp
" 向左垂直分屏 :abo vsp OR :lefta vsp
:ab lvsp abo vsp 

vmap <C-S-P> dO#endif<Esc>PO#if 0<Esc>
:ab stha s/^/\/\//
:ab sthd s/^\/\///
:ab stpa s/^//
:ab stpd s/^//
" 插入模式的移动光标
inoremap <A-h> <Left>   "这个影响了backspace的删除功能
inoremap <A-j> <Down>
inoremap <A-k> <Up>
inoremap <A-l> <Right>
" 高亮VIMScript: Highlight Multiple Regex
:ab hl Highlight
:ab hl* Highlight *
:ab hc Hclear
:ab hca Hclear *
" 编码
let &termencoding=&encoding
set fileencodings=utf-8,gbk
"match OverLength /\%81v.\+/
" C/C++ 代码缩进
au BufNewFile,BufRead *.c,*.cpp,*.h,*.hpp,*.cc
\ set foldmethod=syntax |
\ set tabstop=2 |
\ set shiftwidth=2 |
\ set softtabstop=2
" python 代码缩进
au BufNewFile,BufRead *.py
\ set tabstop=4 |
\ set softtabstop=4 |
\ set shiftwidth=4 |
\ set textwidth=120 |
\ set expandtab |
\ set autoindent |
\ set fileformat=unix |
\ set foldmethod=expr
" 其他代码缩进 
au BufNewFile,BufRead *.js,*.html,*.css
\ set tabstop=2 |
\ set softtabstop=2 |
\ set shiftwidth=2
" 非完整单个词查找
nnoremap <silent> <S-f> :let @/='<C-R><C-W>'<CR>
" 完整单个词查找，并高亮
nnoremap <silent> f :let @/='\<<C-R><C-W>\>'<CR>:set hls<CR>
" 单词变lower 正常模式 guw
" 单词变upper 正常模式 gUw
" 首字母变upper 正常模式 gUl
" 视图模式，插入模式，命令模式
" 从正常模式，视图模式复制到命令模式：在正常模式q:  然后按p
" 强制显示某些符号, 好像没有效果       set listchars=tab:>-,trail:-,eol:$
set nolist
" html 跳转到 css
function! JumpToCSS()
  let id_pos = searchpos("id", "nb", line('.'))[1]
  let class_pos = searchpos("class", "nb", line('.'))[1]

  if class_pos > 0 || id_pos > 0
    if class_pos < id_pos
      execute ":vim '#".expand('<cword>')."' **/*.css"
    elseif class_pos > id_pos
      execute ":vim '.".expand('<cword>')."' **/*.css"
    endif
  endif
endfunction
nnoremap ,gc :call JumpToCSS()<CR>
"call pathogen#incubate("after")
"set statusline=%t\ %y\ format:\ %{&ff};\ [%c,%l]

" Clang-format
let g:clang_format#style_options = {
            \ "BasedOnStyle": "WebKit",
            \ "Standard": "Cpp11",
            \ "ColumnLimit": 140,
            \ "UseTab": "Never",
            \ "IndentWidth": 4,
            \ "NamespaceIndentation": "None",
            \ "AccessModifierOffset": -2,
            \ "IndentCaseLabels": "true",
            \ "AlignAfterOpenBracket": "Align",
            \ "AllowShortFunctionsOnASingleLine": "None",
            \ "BreakBeforeTernaryOperators": "true",
            \ "BreakBeforeBinaryOperators": "true",
            \ "BreakConstructorInitializersBeforeComma": "true",
            \ "AlignTrailingComments": "true",
            \ "BreakBeforeBraces": "Custom",
            \ "BraceWrapping": {
            \     "AfterClass": "true",
            \     "AfterStruct": "true",
            \     "AfterFunction": "true"
            \ }}

let g:clang_format#command = 'clang-format-9'
let g:clang_format#detect_style_file = 0
" let g:clang_format#auto_format = 1
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,h,hpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,h,hpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
autocmd Filetype c++ ClangFormatAutoEnable
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>
" function! UpdateClangFormat()
"     execute "!clang-format-9 -style=file -i %"
"     execute ':e'
"     execute ':syntax on'
" endfunction
" autocmd BufWritePost *.c,*.h,*.cpp,*.cc,*.hpp silent call UpdateClangFormat()
" check if clang-format work
"       :echo executable('clang-format')
" batch transfer format : clang-format-9 -style=file -i `find . -type f -regex ".*\.\(cpp\|h\|hpp\|c\|objc\)"`

" 构造等差数列
"ctrl-v 移动光标覆盖所有数字范围
":I 1 // 1 代表公差

" vimdiff 不能使用
set shellcmdflag=-c

"""""新文件标题""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 <暂时停用>
autocmd BufNewFile *.cpp,*.cc,*.hpp,*.[ch],*.sh,*.java,*.pike,*.py exec ":call SetTitle()" 
"""定义函数SetTitle，自动插入文件头 
func SetTitle() 
	"如果文件类型为.sh文件 
    echo &filetype
	if &filetype == 'sh' 
		call setline(1,          "\##################################################################") 
		call append(line("."),   "\# File Name:     ".expand("%")) 
		call append(line(".")+1, "\# Author:        kct") 
		call append(line(".")+2, "\# mail:          lzhkai1111@qq.com") 
		call append(line(".")+3, "\# Created Time:  ".strftime("%Y-%m-%d %H-%M-%S"))
	    call append(line(".")+4, "\# Last modified:	".strftime("%Y-%m-%d %H-%M-%S"))
		call append(line(".")+5, "\##################################################################") 
		call append(line(".")+6, "\#!/bin/bash") 
		call append(line(".")+7, "")
	elseif &filetype == 'python'
		call setline(1,          "\# coding: utf-8")
        call append(line("."),   "")
        call append(line(".")+1, "\# File Name:     ".expand("%"))
        call append(line(".")+2, "\# Author:        kct")
        call append(line(".")+3, "\# Mail:          lzhkai1111@qq.com")
        call append(line(".")+4, "\# Created Time:  ".strftime("%Y-%m-%d %H-%M-%S"))
        call append(line(".")+5, "\# Last modified: ".strftime("%Y-%m-%d %H-%M-%S"))
        call append(line(".")+6, "")		
	elseif &filetype == 'pike'
		call setline(1,          "\#!/usr/local/pike-8.0.182/bin/pike")
        call append(line("."),   "")	
		call append(line(".")+1, "/***************************************************************") 
		call append(line(".")+2, " > File Name:     ".expand("%")) 
		call append(line(".")+3, " > Author:        kct") 
		call append(line(".")+4, " > Mail:          lzhkai1111@qq.com") 
		call append(line(".")+5, " > Created Time:  ".strftime("%Y-%m-%d %H-%M-%S"))
	    call append(line(".")+6, " > Last modified: ".strftime("%Y-%m-%d %H-%M-%S"))
		call append(line(".")+7, " ***************************************************************/")
		call append(line(".")+8, "")
	else 
		call setline(1,          "/***************************************************************") 
		call append(line("."),   " > File Name:     ".expand("%")) 
		call append(line(".")+1, " > Author:        kct") 
		call append(line(".")+2, " > Mail:          lzhkai1111@qq.com") 
		call append(line(".")+3, " > Created Time:  ".strftime("%Y-%m-%d %H-%M-%S"))
	    call append(line(".")+4, " > Last modified: ".strftime("%Y-%m-%d %H-%M-%S"))
		call append(line(".")+5, " ***************************************************************/") 
		call append(line(".")+6, "")
	endif
	if &filetype == 'cpp'
		call append(line(".")+7, "#include <iostream>")
		call append(line(".")+8, "#include <cstdio>")
		call append(line(".")+9, "using namespace std;")
		call append(line(".")+10, "")
	endif
	if &filetype == 'c'
		call append(line(".")+7, "#include <stdio.h>")
		call append(line(".")+8, "")
	endif
	"新建文件后，自动定位到文件末尾
	exe ":$"
endfunc 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
""实现上面函数中的，Last modified功能
"""""""""""""""""""""""""""""""""""""""""
"autocmd BufWrite,BufWritePre,FileWritePre *.cpp,*.cc,*.hpp,*.[ch],*.sh,*.java,*.pike,*.py ks|call LastMod()|'s  
func LastMod()
	if line("$") > 20
		let l = 20
	else
		let l = line("$")
	endif
	"exe "1," . l . "g/Last modified: /s/Last modified: .*/Last modified: " .
	"\ strftime("%Y %b %d")
	exe "1,10g/Last modified: /s/Last modified: .*/Last modified: " . strftime("%Y-%m-%d %H-%M-%S")
endfunc

" author : black_trees

syntax on
set wildmenu
set nocompatible
set foldmethod=marker
set rnu mouse=a ruler nu
set timeoutlen=666 ttimeoutlen=0
set backup swapfile undofile
set backupdir=C:\Users\Administrator\.vimtmp\backup
set undodir=C:\Users\Administrator\.vimtmp\undo
set directory=C:\Users\Administrator\.vimtmp\swp
set autoread autochdir
set autoindent tabstop=4 shiftwidth=4 softtabstop=4
set backspace=indent,eol,start
set encoding=utf-8
set renderoptions=type:directx
set guifont=Maple\ Mono\ SC\ NF\ Enonya:h14:W200:cANSI
set guioptions-=T guioptions-=R guioptions-=L guioptions-=r guioptions-=l guioptions-=b guioptions-=m
set hlsearch 
nnoremap <C-l> :noh<CR><C-l>

let g:netrw_cursor=0

color yuyuko

inoremap [ []<Esc>i
inoremap {<CR> {}<ESC>i<CR><ESC>O
inoremap ( ()<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i

func Bteqwq()
	call append(0, "// author : black_trees")
	call append(1, "// make yourself an idiot.")
	call append(2, "")
	call append(3, "#include <cmath>")
	call append(4, "#include <cstdio>")
	call append(5, "#include <vector>")
	call append(6, "#include <cstring>")
	call append(7, "#include <utility>")
	call append(8, "#include <iostream>")
	call append(9, "#include <algorithm>")
	call append(10, "")
	call append(11, "#define Enonya")
	call append(12, "#define endl \'\\n\'")
	call append(13, "")
	call append(14, "using namespace std;")
	call append(15, "using i64 = long long;")
	call append(16, "using ldb = long double;")
	call append(17, "using u64 = unsigned long long;")
	call append(18, "")
	call append(19, "int main() {")
	call append(20, "")
	call append(21, "	cin.tie(0) -> sync_with_stdio(false);")
	call append(22, "	cin.exceptions(cin.failbit | cin.badbit);")
	call append(23, "")
	call append(24, "	")
	call append(25, "")
	call append(26, "	return 0;")
	call append(27, "}")
endfunc

call plug#begin('C:/Program\ Files (x86)/Vim/vimfiles/plugged')
	Plug 'terryma/vim-smooth-scroll'
	Plug 'preservim/nerdcommenter'
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
	Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
	Plug 'skywind3000/vim-auto-popmenu'
	Plug 'skywind3000/vim-dict'
call plug#end()

set cpt=k,i
set shortmess+=c
set completeopt=menu,menuone,noselect
let g:apc_cr_confirm = 1
let g:apc_enable_ft = {'text':1, 'c':1, 'cpp':1, 'python':1}

let g:markdown_fenced_languages =['c', 'cpp', 'python']

let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

let g:clap_theme = 'yuyuko_clap'

command! W :Clap windows
command! GitTerm :term bash.exe --login -i

nmap F :e ./<CR>
nmap f :Clap files<CR>
nmap <leader>f :Clap blines<CR>
nmap <leader>F :Clap buffers<CR> 
nmap <leader>n :tabnew<CR>
nmap <leader>tg :GitTerm<CR>
nmap <leader>tc :terminal<CR>
" 记得加 PATH

nmap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 1)<CR>
nmap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 1)<CR>
nmap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 1)<CR>
nmap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 1)<CR>

func EnableBg()
  silent exec libcallnr("vimtweak.dll", "SetAlpha", 230)
endfunc
func EnableTransparency()
  silent exec libcallnr("vimtweak.dll", "SetAlpha", 190)
endfunc
func DisableTransparency()
  silent exec libcallnr("vimtweak.dll", "SetAlpha", 255)
endfunc

map <F8> <ESC>:call EnableBg()<CR>
map <F9> <ESC>:call EnableTransparency()<CR>
map <F10> <ESC>:call DisableTransparency()<CR>
map <F11> <ESC>:syntax off<CR>
map <F12> <ESC>:syntax on<CR>

exec 'cd ' . fnameescape('D:/Informatics')

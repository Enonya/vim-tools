
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
set guifont=Hermit:h14:cANSI
set guioptions-=T guioptions-=r guioptions-=l guioptions-=b guioptions-=m

let g:netrw_cursor=0

color yuyuko

inoremap [ []<Esc>i
inoremap {<CR> {}<ESC>i<CR><ESC>O
inoremap ( ()<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i

func Bteqwq()
	call append(0, "// author : black_trees")
	call append(1, "")
	call append(2, "#include <cmath>")
	call append(3, "#include <cstdio>")
	call append(4, "#include <cstring>")
	call append(5, "#include <iostream>")
	call append(6, "#include <algorithm>")
	call append(7, "")
	call append(8, "#define endl \'\\n\'")
	call append(9, "")
	call append(10, "using namespace std;")
	call append(11, "using i64 = long long;")
	call append(12, "")
	call append(13, "int main() {")
	call append(14, "")
	call append(15, "	cin.tie(0) -> sync_with_stdio(false);")
	call append(16, "	cin.exceptions(cin.failbit | cin.badbit);")
	call append(17, "")
	call append(18, "	")
	call append(19, "")
	call append(20, "	return 0;")
	call append(21, "}")
endfunc

call plug#begin('C:/Program\ Files (x86)/Vim/vimfiles/plugged')
	Plug 'preservim/vim-markdown'
	Plug 'preservim/nerdcommenter'
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
	Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
call plug#end()

packadd termdebug
let g:vim_markdown_math = 1

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

func EnableTransparency()
  silent exec libcallnr("vimtweak.dll", "SetAlpha", 200)
endfunc
func DisableTransparency()
  silent exec libcallnr("vimtweak.dll", "SetAlpha", 255)
endfunc

map <F9> <ESC>:call EnableTransparency()<CR>
map <F10> <ESC>:call DisableTransparency()<CR>

exec 'cd ' . fnameescape('D:/Informatics')

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

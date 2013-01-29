" .vimrc
" " See: http://vimdoc.sourceforge.net/htmldoc/options.html for details

" For multi-byte character support (CJK support, for example):
" "set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,gb18030,latin1

syntax on
set nocompatible
filetype plugin indent on

set history=700
set autoread

set tabstop=4
set shiftwidth=4

set nu " show line numbers, use ":set nu!" to disable
set paste

let $PAGER=''
"latex plugin
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

" automatically reload vimrc
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

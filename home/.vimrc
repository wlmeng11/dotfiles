" .vimrc
" " See: http://vimdoc.sourceforge.net/htmldoc/options.html for details

" For multi-byte character support (CJK support, for example):
" "set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,gb18030,latin1

syntax on
set nocompatible
set exrc
set secure
filetype plugin indent on
" execute pathogen#infect()

set history=700
set autoread

set tabstop=4
set shiftwidth=4

set nu " show line numbers, use ":set nu!" to disable
set modeline
set ls=2 " always show filename at bottome
" set paste " don't automatically insert tabs when pasting
set foldmethod=syntax
set foldlevelstart=99
set fdc=1

let $PAGER=''
" latex plugin
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

" automatically reload vimrc
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" bind <F5> to toggle word-wrap
:map <F5> :set nowrap! <CR>
" bind <F7> to toggle syntax highlighting
:map <F7> :if exists("g:syntax_on") <Bar>
	\ syntax off <Bar>
	\ else <Bar>
	\ syntax enable <Bar>
	\ endif <CR>
" bind <F3> to toggle line numbers
:map <F3> :set nu! <CR>
" bind <F8> to compile in g++ and run
map <F8> : !g++ % && ./a.out <CR>

set background=dark
" colorscheme tango

" vimdiff color scheme
" highlight DiffChange cterm=none ctermfg=black ctermbg=LightGreen gui=none guifg=bg guibg=LightGreen
" highlight DiffText cterm=none ctermfg=black ctermbg=Red gui=none guifg=bg guibg=Red

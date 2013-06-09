" .vimrc
" " See: http://vimdoc.sourceforge.net/htmldoc/options.html for details

" For multi-byte character support (CJK support, for example):
" "set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,gb18030,latin1

execute pathogen#infect()
syntax on
set nocompatible " don't run in VI compatibility mode
set exrc " read directory-specific config files
set secure " restrictions for reading config files
set background=dark
" set autochdir " Change directory to the current buffer when opening files.
set showcmd

set history=700
set autoread
set wildmode=longest,list,full " tab completion
set wildmenu
set hlsearch
set incsearch " highlight matches while searching with "/"

set tabstop=4
set shiftwidth=4
set enc=utf8 " set encoding to utf8 for gvim

set nu " show line numbers, use ":set nu!" to disable
set modeline
set ls=2 " always show filename at bottome
set foldmethod=syntax
set foldlevelstart=99 " initially expand all folds
set fdc=1 " show folds in left column

filetype plugin indent on
" Filetype specific stuff
autocmd FileType ruby compiler ruby
set ofu=syntaxcomplete#Complete " auto-complete in insert mode
" <C-n>			method/variable
" <C-x><C-f>	filename
" <C-x><C-l>	whole line

" automatically reload vimrc
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

nnoremap K i<CR><Esc>

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" bind <F2> to display time and date
map <F2> :echo 'Current time is ' . strftime('%c')<CR>
" bind <F3> to toggle line numbers
map <F3> :set nu! <CR>
" bind <F5> to toggle word-wrap
map <F5> :set nowrap! <CR>
" bind <F7> to toggle syntax highlighting
map <F7> :if exists("g:syntax_on") <Bar>
	\ syntax off <Bar>
	\ else <Bar>
	\ syntax enable <Bar>
	\ endif <CR>

" miniBufExplorer config
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1 " switch buffers with <C-Tab> and <C-S-Tab>
let g:miniBufExplModSelTarget = 1

" netrw configuration
let g:netrw_liststyle=3 " tree style
" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_browse_split = 4
let g:netrw_altv = 1

let $PAGER=''
" latex plugin
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

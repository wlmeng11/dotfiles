" William Meng's .vimrc file
" " See: http://vimdoc.sourceforge.net/htmldoc/options.html for details
"
" For multi-byte character support (CJK support, for example):
" "set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,gb18030,latin1

""" Vundle: a package manager for VIM
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'VundleVim/Vundle.vim'
" (Vundle manages itself)
" Language_Support:
Bundle 'wlmeng11/vim-latex'
Bundle 'plasticboy/vim-markdown'
Bundle 'vim-scripts/openscad.vim'
Bundle 'jplaut/vim-arduino-ino'
"Bundle 'tmhedberg/SimpylFold'
Bundle 'klen/python-mode'
" Appearance:
Bundle 'tomasr/molokai'
Bundle 'bling/vim-airline'
" Autocomplete:
"Bundle 'scrooloose/syntastic'
Bundle 'dense-analysis/ale'
Bundle 'ervandew/supertab'
Bundle 'Raimondi/delimitMate'
" Miscellaneous:
Bundle 'terryma/vim-multiple-cursors'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'taglist.vim'
Bundle 'Rykka/clickable.vim'
Bundle 'Rykka/clickable-things'

""" KEYBINDINGS
let mapleader = "\<Space>" "spacebar as Leader
nnoremap <Leader>o :o 
nnoremap <Leader>e :e 
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>s :s
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

""" VISUAL APPEARANCE
set background=dark
color molokai

syntax on " enable syntax highlighting
set nocompatible " don't run in VI compatibility mode
set timeout timeoutlen=3000 ttimeoutlen=100 " shorten terminal escape wait time
set exrc " read directory-specific config files
set secure " restrictions for reading config files
set mouse=a " better mouse support
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

set number " show line numbers, use ":set nu!" to disable
set modeline
set ls=2 " always show filename at bottome
"set foldmethod=syntax
set foldlevelstart=99 " initially expand all folds
set foldcolumn=4 " show folds in left column

set ofu=syntaxcomplete#Complete " auto-complete in insert mode
" <C-n>			Keyword completion
" <C-x><C-f>	Filename completion
" <C-x><C-l>	Line completion
" <C-x><C-o>	Omnicomplete
" <C-x><C-u>	Eclim
highlight Pmenu ctermbg=238 gui=bold "improve autocomplete menu color

" automatically reload vimrc after saving an edit to it
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

set listchars=trail:.,extends:>

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" Removes trailing spaces
function! TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction
"autocmd BufWritePre * execute TrimWhiteSpace()
"autocmd BufWritePost * normal ``

set wildignore=*.swp,*.bak,*.pyc,*.class,*.jar
set wildignore+=*.gif,*.png,*.jpg,*.o,*.d,*.pdf
set wildignore+=*.aux,*.log,*.pyg

" tmux pane integration
if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      " The sleep and & gives time to get back to vim so tmux's focus tracking
      " can kick in and send us our ^[[O
      execute "silent !sh -c 'sleep 0.01; tmux select-pane -" . a:tmuxdir . "' &"
      redraw!
    endif
  endfunction
  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te
  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w><Left>
  map <C-j> <C-w><Down>
  map <C-k> <C-w><Up>
  map <C-l> <C-w><Right>
endif

" reload vimrc with \r
map <Leader>r :source ~/.vimrc<CR>
map \033[27;5;9~ :bnext<CR>
map [27;5;9~ :bn<CR>
" map   <Control><Tab> :bn<CR>
map [Z :bp<CR>
" map   <Control><Shift><Tab> :bp<CR>

nnoremap K i<CR><Esc> " Split line

" bind <F2> to display time and date
map <F2> :echo 'Current time is ' . strftime('%c')<CR>
" bind <F3> to toggle line numbers
map <F3> :set nu! <CR> :set rnu! <CR>
" bind <F5> to toggle word-wrap
map <F5> :set nowrap! <CR>
" bind <F7> to toggle syntax highlighting
map <F7> :if exists("g:syntax_on") <Bar>
	\ syntax off <Bar>
	\ else <Bar>
	\ syntax enable <Bar>
	\ endif <CR>
map <C-s> :set spell!<CR>

filetype plugin indent on
"" Filetype specific stuff
"ruby
autocmd FileType ruby compiler ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

"Java
let java_ignore_javadoc=1
autocmd FileType java nmap <F11> :w<CR>:!javac % && java `basename % .java`<CR>

"Python
autocmd FileType python nmap <F11> :w<CR>:!python ./%<CR>
autocmd FileType python set foldmethod=indent

" LaTeX
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
let g:Tex_AutoFolding = 0
au BufWritePost *.tex !pdflatex -interaction nonstopmode --shell-escape %
au FileType tex nmap <F9> :!pdflatex -interaction nonstopmode --shell-escape %<CR>
au BufWritePre *.tex retab
let g:tex_noindent_env = 'document\|verbatim\|comment\|lstlisting\|minted'
let g:Imap_UsePlaceHolders = 0  " disable automatic insertion of <++>
"autocmd FileType tex set et

" LISP
" let g:slimv_swank_cmd = '! xterm -e bigloo --load ~/.vim/bundle/slimv/slime/start-swank.lisp &'

" Arduino
autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp
autocmd FileType *.ino set foldmethod=syntax


""""" PLUGIN CONFIGURATION
" airline config
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Syntastic
let g:syntastic_c_check_header = 1

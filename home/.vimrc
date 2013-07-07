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
set mouse=a
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
set foldmethod=syntax
set foldlevelstart=99 " initially expand all folds
set fdc=1 " show folds in left column

set ofu=syntaxcomplete#Complete " auto-complete in insert mode
" <C-n>			Keyword completion
" <C-x><C-f>	Filename completion
" <C-x><C-l>	Line completion
" <C-x><C-o>	Omnicomplete
" <C-x><C-u>	Eclim

" automatically reload vimrc
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

set wildignore=*.swp,*.bak,*.pyc,*.class,*.jar,*.gif,*.png,*.jpg,*.o,*.d

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
map \033[27;5;9~ :bnext
map [27;5;9~ :bn<CR>
" map   <Control><Tab> :bn<CR>
map [Z :bp<CR>
" map   <Control><Shift><Tab> :bp<CR>

nnoremap K i<CR><Esc>

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

filetype plugin indent on
" Filetype specific stuff
"ruby
autocmd FileType ruby compiler ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

""" Plugins
"" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
" My Bundles here:
"
" original repos on github
Bundle 'FredKSchott/CoVim'
" Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'Floobits/floobits-vim'
" needs to be moved to ~/.vim/bundle/Floobits
Bundle 'SirVer/ultisnips'
Bundle 'ervandew/supertab'

" miniBufExplorer config
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1 " switch buffers with <C-Tab> and <C-S-Tab> in GVIM
let g:miniBufExplModSelTarget = 1

" netrw configuration
let g:netrw_liststyle=3 " tree style
" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_browse_split = 4
let g:netrw_altv = 1

" latex plugin
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"


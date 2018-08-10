" William Meng's neovim configuration file

if &compatible
 set nocompatible
endif

call plug#begin('~/.local/share/nvim/plugged')

" Appearance
Plug 'tomasr/molokai'
Plug 'bling/vim-airline'

" Editor Features
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/vim-easy-align'
Plug 'ntpeters/vim-better-whitespace'

" Language Support
"Plug 'klen/python-mode', { 'for': 'python' }
Plug 'JamshedVesuna/vim-markdown-preview'

" Initialize plugin system
call plug#end()


""" CORE FEATURES
filetype plugin indent on
syntax enable
set number
set mouse=a
set tabstop=4
set shiftwidth=4

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
map <Leader>r :source ~/.config/nvim/init.vim <CR> " reload vimrc with \r

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


""" VISUAL APPEARANCE
set background=dark
color molokai


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

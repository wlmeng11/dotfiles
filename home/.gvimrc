" settings for GVIM

set guioptions-=T
set guioptions-=r
set guifont=monospace\ 12

" use light between 7am and 6pm
if strftime("%H") > 7 && strftime("%H") < 18
  set background=light
else
  set background=dark
endif

colorscheme solarized

vmap <C-C> "+y

map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>

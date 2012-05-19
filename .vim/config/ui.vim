" Hightlight the line where the cursor is.
set cursorline
" Always show the statusline and commandline
set laststatus=2
" show list char by default
set list
" listchar
set listchars=nbsp:¤,tab:▸\ ,trail:¤,eol:¬,extends:❯,precedes:❮
set fillchars=stl:\ ,stlnc:⎼,vert:⎥,fold:\ ,diff:\ 
set showbreak=↪

if v:version > '702'
    set colorcolumn=80,120
endif

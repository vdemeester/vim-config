" set shell=/bin/sh
" Remembering the 1000 last command. Vim default is 20.
set history=1000
set confirm

" Enhancing command-line completion (with options)
set wildmenu
set wildmode=list:longest,list:full
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*~,*.hi
" some filetypes got lower priority
set su=.h,.bak,~,.o,.info,.swp,.obj

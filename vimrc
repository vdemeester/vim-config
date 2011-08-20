" .vimrc
" Author: Vincent Demeester <vincentATdemeester.fr>
" Source: https://github.com/vdemeester/vim-config
"
" Preambule --------------------------------------------------------------- {{{
" Load pathogen (if present)
" This has to be before filetype plugin on as pathogen won't work then.
filetype off
runtime pathogen_init
filetype on
filetype plugin indent on
" Drop compatibility
set nocompatible
" }}}
" Basic options ----------------------------------------------------------- {{{
" Set default encoding to utf-8
set encoding=utf-8
set fileencoding=utf-8
" Remembering the 600 last command. Vim default is 20.
set history=600
" Hightlight the line where the cursor is.
set cursorline
" Hide the mouse when writing/using vim (who needs a mouse anyway !)
set mousehide
" Set Mininal screen lines above/below the cursor
set scrolloff=5
" Do not forbid switching buffer in case of modified buffer
set hidden
" Enable all backspace stuff 
set backspace=eol,start,indent
" Show matches when typing the pattern
set incsearch
" Ignore case by default in search
" Possible to re-enabling it using \C in the search pattern
set ignorecase
" Highlight matches of search by default - use :nohlsearch for hiding it
set hlsearch
" Magic mode (in pattern matching)
" Possible to disable it using \M (read help for more informations)
set magic
" Show the matche pair (for(,[,{,<,…)
set showmatch
" Always show the statusline and commandline
set laststatus=2
" Enhancing command-line completion (with options)
set wildmenu
set wildmode=list:longest,list:full
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*~
" some filetypes got lower priority
set su=.h,.bak,~,.o,.info,.swp,.obj
" Set tab/space default behvior. {{{
" The rest is going to be set by filetype
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
" }}}
" Remaping mapleader (default is \) {{{
let mapleader = ","
let g:mapleader = ","
" }}}
" Status line {{{
" Change the default statusline
set statusline=%f\ %m
set statusline+=\ %{fugitive#statusline()}
set statusline+=\ %h%r%=[%{&encoding}
set statusline+=\ %{&fileformat}
set statusline+=\ %{strlen(&ft)?&ft:'none'}
set statusline+=\ %{getfperm(@%)}]
set statusline+=\ 0x%B\ %12.(%c:%l/%L%)
" }}}
" Backups {{{
" Backup & Swap file
" The point here is : tell vim not to write this kind of file in the current 
" folder (and even deactivate it if possible).
"set nobackup
"set nowb
"set noswapfile
set undodir=~/.vim/tmp/undo/     " undo files
set backupdir=~/.vim/tmp/backup/ " backups
set directory=~/.vim/tmp/swap/   " swap files
set backup                        " enable backups
" Make Vim able to edit crontab files again.
set backupskip=/tmp/*,/private/tmp/*" 
" }}}
" }}}
" Colors ------------------------------------------------------------------ {{{
if has("gui_running")
    " Simple GUI, almost similar to console version
    " i > Use Vim icon
    " t > tearoff menu items. TODO learn what it means
    " a > autoselect (means that vim might try to share selection with system.
    " c > Use console dialogs
    set guioptions=itac
    " allocate 2 pixels for folding column (even if no folding present)
    set foldcolumn=2
    " Light background on GUI version
    set background=light
else
    if $TERM =~ "-256color"
        set t_Co=256
    endif
    " Dark background on CLI version (as terminal background usually dark)
    set background=dark
    " Enable mouse support in CLI
    set mouse=a
endif
" Colorscheme for both dark and light background
colorscheme solarized
" }}}

" Highlight column that are listed (80 and 120)
if v:version > '702'
    set colorcolumn=80,120
endif

" Open man page
" FIXME where does it comes from
runtime! ftplugin/man.vim

" fast reloading & editing .vimrc file
map <leader>s :source $MYVIMRC<cr>
map <leader>e :e! $MYVIMRC<cr>
" When .vimrc is editited, reoad it automatically
autocmd! bufwritepost .vimrc source $MYVIMRC

" Quick access to useful funtions
" - Quick saving
nmap <leader>w :w!<CR>
" - Toggle typo characters
nmap <leader>tl :set list!<CR>
" - Toggle line numbers
nmap <leader>tn :set number!<CR>
" - Toggle relative numbers (fun)
nmap <leader>tN :set relativenumber!<CR>
" - Spell checking
nmap <leader>ts :set spell!<CR>
" - Quick change directory
map <leader>cd :cd %:p:h<cr>
" - Toggle Gundo view
nmap <leader>u :GundoToggle<cr>

" Toggle quicklist window
nmap <leader>tq :QFix<CR>
" Customization of netrw
" - No mouse support on netrw as it is *really* annoying
let g:netrw_mousemaps = 0
" Customization : Preview pane (diff) at the bottom of the current buffer
let g:gundo_preview_bottom = 1
" Customization of unimpaired keymap (not upstream right now)
let g:unimpaired_leader_next = ')'
let g:unimpaired_leader_prev = '('

" Customize fugitive
if has("autocmd")
    autocmd BufReadPost fugitive://* set bufhidden=delete
endif

" listchar      
set listchars=nbsp:¤,tab:▸\ ,trail:¤,extends:>,precedes:<,eol:¬

syntax enable
" colorise les nbsp       
highlight NbSp ctermbg=lightgray guibg=#1A1A1A
match NbSp /\%xa0/

" Fileformat
set ffs=unix,dos,mac
nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>

""""""""""""""""""""""""""""""
" Visual
""""""""""""""""""""""""""""""
" From an idea by Michael Naumann
function! VisualSearch(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"
  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")
  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  else
    execute "normal /" . l:pattern . "^M"
  endif
  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

"Basically you press * or # to search for the current selection !! Really useful
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" keep the current selection when indenting (thanks cbus)
vnoremap < <gv
vnoremap > >gv

" From rtomayko : « I use these commands in my TODO file »
map ,a o<ESC>:r!date +'\%A, \%B \%d, \%Y'<CR>:r!date +'\%A, \%B \%d, \%Y' \| sed 's/./-/g'<CR>A<CR><ESC>
map ,o o[ ] 
map ,O O[ ] 
map ,x :s/^\[ \]/[x]/<CR>
map ,X :s/^\[x\]/[ ]/<CR>

" Custom gloabal variable These variable could be used in several plugins and
" are meant to be set (or not) in the hostname-specific config file.
" Is my keymap in bepo, or not ?
" - yes = 1
" - no  = 0
" by default let say, it's not
let g:keymap_bepo = 0
" Finaly source `hostname` specific configuration file if existing
let hostfile=$HOME . '/.vim/vimrc-' . hostname()
if filereadable(hostfile)
    exe 'source ' . hostfile
endif
" if we are on a bepo keymap operating system, load the remapping file.
if g:keymap_bepo == 1
    exe 'source ' . $HOME . '/.vim/vimrc-bepo'
endif
" vim:foldmethod=marker foldmarker={{{,}}}

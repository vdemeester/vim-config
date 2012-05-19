" Basic options --------------------------------------------------------------- {{{
" Set default encoding to utf-8
set encoding=utf-8
set fileencoding=utf-8
" Fileformat
set ffs=unix,dos,mac
" Hightlight the line where the cursor is.
set cursorline
" Hide the mouse when writing/using vim (who needs a mouse anyway !)
set mousehide
" Set Mininal screen lines above/below the cursor
set scrolloff=5
" Indicates a fast terminal connection
set ttyfast
" Do not redraw the screen 
set lazyredraw
" Splitting below and right by default
set splitbelow
set splitright
" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="
" Enable all backspace stuff 
set backspace=eol,start,indent
" Always show the statusline and commandline
set laststatus=2
" Enhancing command-line completion (with options)
set wildmenu
set wildmode=list:longest,list:full
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*~,*.hi
" some filetypes got lower priority
set su=.h,.bak,~,.o,.info,.swp,.obj
" Interface characters {{{
" show list char by default
set list
" listchar
set listchars=nbsp:¤,tab:▸\ ,trail:¤,eol:¬,extends:❯,precedes:❮
set fillchars=stl:\ ,stlnc:⎼,vert:⎥,fold:\ ,diff:\ 
set showbreak=↪
" colorise les nbsp       
highlight NbSp ctermbg=lightgray guibg=#1A1A1A
match NbSp /\%xa0/
" }}}
" Set tab/space default behvior. {{{
" The rest is going to be set by filetype
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set wrap
set textwidth=85
" Stolen from steve losh vim config
" Better formatoptions
set formatoptions=qrn1
" }}}
" Status line {{{
" Change the default statusline
set statusline=%f\ %m
set statusline+=\ %{fugitive#statusline()}
"set statusline+=\ %#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=\ %h%r%=[%{&encoding}
set statusline+=\ %{&fileformat}
set statusline+=\ %{strlen(&ft)?&ft:'none'}
set statusline+=\ %{getfperm(@%)}]
set statusline+=\ 0x%B\ %12.(%c:%l/%L%)
" }}}
" Backups {{{
" Backup & Swap file
" persistant undo
if version > 702
    set undofile
    set undoreload=10000
    set undodir=~/.vim/tmp/undo/     " undo files
endif
" Do not make backup and swap file in the current dir
set backupdir=~/.vim/tmp/backup/ " backups
set directory=~/.vim/tmp/swap/   " swap files
set backup                        " enable backups
" Make Vim able to edit crontab files again.
set backupskip=/tmp/*,/private/tmp/*" 
" }}}
" ColorColumn {{{
" Highlight column that are listed (80 and 120)
if v:version > '702'
    set colorcolumn=80,120
endif
" }}}
" Completion {{{
" Better Completion
set completeopt=longest,menuone,preview
" }}}
" Open man page
" FIXME where does it comes from
runtime! ftplugin/man.vim
" }}}
" Colors ---------------------------------------------------------------------- {{{
if has("gui_running")
    " Simple GUI, almost similar to console version
    " i > Use Vim icon
    " t > tearoff menu items. TODO learn what it means
    " a > autoselect (means that vim might try to share selection with system.
    " c > Use console dialogs
    set guioptions=itac
    " allocate 2 pixels for folding column (even if no folding present)
    set foldcolumn=0
endif
" }}}
" Quick Editing --------------------------------------------------------------- {{{
" fast reloading & editing .vimrc file
" map <leader>s :source $MYVIMRC<cr>
map <leader>ev <C-w>s<C-w>t<C-w>L:e $MYVIMRC<cr>
" }}}
" Convenience Mapping (leader) ------------------------------------------------ {{{
" keep the current selection when indenting (thanks cbus)
vnoremap < <gv
vnoremap > >gv
" From rtomayko : « I use these commands in my TODO file »
map ,a o<ESC>:r!date +'\%A, \%B \%d, \%Y'<CR>:r!date +'\%A, \%B \%d, \%Y' \| sed 's/./-/g'<CR>A<CR><ESC>
map ,o o[ ] 
map ,O O[ ] 
map ,x :s/^\[ \]/[x]/<CR>
map ,X :s/^\[x\]/[ ]/<CR>
" Filetype switch
nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>
" Quick access to useful funtions
" - Quick saving
nmap <leader>w :w!<CR>
" - Toggle typo characters
nmap <leader>tl :set list!<CR>
" Line numbers ----------------------------------------------------------- {{{
" - Toggle line numbers
" nnoremap <silent> <leader>tn :call NumberToggle()<cr>
" nmap <leader>tn :set number!<CR>
nmap <leader>tn :set number!<CR>
" - Toggle relative numbers (fun)
nmap <leader>tN :set relativenumber!<CR>
" }}}
" - Spell checking
nmap <leader>ts :set spell!<CR>
" - Quick change directory
map <leader>cd :cd %:p:h<cr>
" - Toggle Gundo view
nmap <leader>u :GundoToggle<cr>
" Toggle quicklist window
nmap <leader>tq :QFix<CR>
" Substitute
nnoremap <leader>s :%s//<left>
" Easier linewise reselection
nnoremap <leader>v V`]
" Tags
nnoremap <leader>T :!ctags -R -f ./tags .<cr>
" → save as root
cmap w!! %!sudo tee > /dev/null %
" }}}
" Plugin settings ------------------------------------------------------------- {{{
" Fugitive {{{
if has("autocmd")
    autocmd BufReadPost fugitive://* set bufhidden=delete
endif
" }}}
" Gundo {{{
" Customization : Preview pane (diff) at the bottom of the current buffer
let g:gundo_preview_bottom = 1
" }}}
" netrw {{{
" - No mouse support on netrw as it is *really* annoying
let g:netrw_mousemaps = 0
" }}}
" Scratch {{{
command! ScratchToggle call ScratchToggle()
function! ScratchToggle() " {{{
  if exists("w:is_scratch_window")
    unlet w:is_scratch_window
    exec "q"
  else
    exec "normal! :Sscratch\<cr>\<C-W>J:resize 13\<cr>"
    let w:is_scratch_window = 1
  endif
endfunction " }}}
nnoremap <silent> <leader><tab> :ScratchToggle<cr>
" }}}
" pandoc {{{
au BufNewFile,BufRead *.page   set filetype=pandoc
" }}}
" }}}

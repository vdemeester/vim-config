" Set default encoding to utf-8
set encoding=utf-8
set fileencoding=utf-8
" Fileformat
set ffs=unix,dos,mac

" Filetype switch
nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>

" - Quick change directory
map <leader>cd :cd %:p:h<cr>

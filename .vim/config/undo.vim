" persistant undo
if version > 702
    set undofile
    set undoreload=10000
    set undodir=~/.vim/tmp/undo/     " undo files
endif


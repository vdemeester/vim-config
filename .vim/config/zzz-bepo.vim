" Is my keymap in bepo, or not ?
" - yes = 1
" - no  = 0
" by default let say, it's not
" if we are on a bepo keymap operating system, load the remapping file.
if g:keymap_bepo == 1
    exe 'source ' . $HOME . '/.vim/vimrc-bepo'
endif


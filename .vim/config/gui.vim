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


" set colorcolumn=+1 " show textwidth limit
autocmd ColorScheme * highlight! link ColorColumn StatusLineNC

if $TERM =~ "-256color"
    set t_Co=256
endif
set background=dark

colorscheme xoria256

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" colorise les nbsp       
highlight NbSp ctermbg=lightgray guibg=#1A1A1A
match NbSp /\%xa0/

" .vimrc
" Author: Vincent Demeester <vincent+vim AT demeester.fr>
" Source: https://github.com/vdemeester/vim-config
"
" We are using vim-unbundle and the same configuration type as @sunaku
runtime bundle/unbundle/unbundle.vim

" Delegate configuration to files in config/
runtime! config/**/*.vim
" vim:foldmethod=marker foldmarker={{{,}}}

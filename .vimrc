set nocompatible "Not vi compativle (Vim is king)

""""""""""""""""""""""""""""""""""
" Syntax and indent
""""""""""""""""""""""""""""""""""
syntax on " Turn on syntax highligthing
set showmatch  "Show matching bracets when text indicator is over them

colorscheme delek

" Switch on filetype detection and loads 
" indent file (indent.vim) for specific file types
filetype indent on
filetype on
set autoindent " Copy indent from the row above
set si " Smart indent

""""""""""""""""""""""""""""""""""
" Some other confy settings
""""""""""""""""""""""""""""""""""
" set nu " Number lines
set hls " highlight search
set lbr " linebreak

" Use 2 space instead of tab during format
set expandtab
set shiftwidth=2
set softtabstop=2
let g:FindFileIgnore = ['*.o', '*.pyc', '*.class', '*/tmp/*'] 
set wildignore+=*/target/*
set nu "Line numbering on by default
<<<<<<< HEAD
set foldmethod=indent
=======
execute pathogen#infect()
>>>>>>> de6d19dba637136c435aa1f7864d8a4b29f19f22


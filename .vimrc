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
set wildignore+=*/target/*,*.jar
set nu "Line numbering on by default
set foldmethod=indent
execute pathogen#infect()
set foldlevelstart=20
map <C-n> :NERDTreeToggle<CR>
set incsearch
set hlsearch
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_working_path_mode=''
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_by_filename = 1


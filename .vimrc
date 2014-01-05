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
filetype off
call pathogen#incubate()
call pathogen#helptags()
filetype on
set foldlevelstart=20
map <C-n> :NERDTreeToggle<CR>
set incsearch
set hlsearch
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_working_path_mode=''
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_by_filename = 1
set vb " visual bell
set wildmenu
set autoread

set nobackup
set nowritebackup
set noswapfile

nmap <silent> ,cd :lcd %:h<CR>
nmap <silent> ,md :!mkdir -p %:p:h<CR>
nmap <silent> ,n :nohls<CR>
nmap <silent> ,b :bnext<CR>
nmap <silent> ,B :bprevious<CR>

nmap <silent> ,qq :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

nmap <silent> ,sw :execute ":resize " . line('$')<cr>

nnoremap <C-E> ,

"-----------------------------------------------------------------------------
" FSwitch mappings
"-----------------------------------------------------------------------------
nmap <silent> ,of :FSHere<CR>
nmap <silent> ,ol :FSRight<CR>
nmap <silent> ,oL :FSSplitRight<CR>
nmap <silent> ,oh :FSLeft<CR>
nmap <silent> ,oH :FSSplitLeft<CR>
nmap <silent> ,ok :FSAbove<CR>
nmap <silent> ,oK :FSSplitAbove<CR>
nmap <silent> ,oj :FSBelow<CR>
nmap <silent> ,oJ :FSSplitBelow<CR>

au FileType scala let b:fswitchdst = 'scala'

" Matches scala files that do not end with Test.scala
au BufEnter *\(Test\)\@!.scala let b:fswitchlocs = 'reg:+/main/scala+/test/scala/+' | let b:fswitchfnames='/$/Test/'

" Matches scala files that do end with Test.scala
au BufEnter *Test.scala let b:fswitchlocs = 'reg:+/test/scala+/main/scala/+' | let b:fswitchfnames='/Test$//'

let b:fswitchlocs = 'reg:/main/test/'
filetype plugin on
set runtimepath+=~/.vim/xpt-personal
let Grep_Default_Filelist = './**/*.scala'
nnoremap <silent> ,g :Grep<CR>

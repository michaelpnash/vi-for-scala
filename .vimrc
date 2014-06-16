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
" set si " Smart indent

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
inoremap <C-@> <C-n>
map <C-n> :NERDTreeToggle<CR>
set incsearch
set hlsearch
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_working_path_mode=''
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_by_filename = 1
let g:ctrlp_custom_ignore = 'dgrid\|dijit\|dojo\|dojox\|put-selector\|xstyle\|DS_Store\|git'
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
nmap <C-P> :CtrlPMixed<CR>

nmap <silent> ,qq :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

nmap <silent> ,sw :execute ":resize " . line('$')<cr>

nnoremap <C-E> ,

"-----------------------------------------------------------------------------
" FSwitch mappings
"-----------------------------------------------------------------------------
nmap <silent> ,T :FSHere<CR>
nmap <silent> ,ol :FSRight<CR>
nmap <silent> ,vt :FSSplitRight<CR>
nmap <silent> ,oh :FSLeft<CR>
nmap <silent> ,lt :FSSplitLeft<CR>
nmap <silent> ,ok :FSAbove<CR>
nmap <silent> ,at :FSSplitAbove<CR>
nmap <silent> ,T :FSBelow<CR>
nmap <silent> ,t :FSSplitBelow<CR>

au FileType scala let b:fswitchdst = 'scala'

" Matches scala files that do not end with Test.scala
au BufEnter *\(Test\)\@!.scala let b:fswitchlocs = 'reg:+/app/+/test/+' | let b:fswitchfnames='/$/Test/'
" Use the one below if you're dealing with a Scala app with src/main/scala and
" src/test/scala intead of app and test directories (like Play)
" au BufEnter *\(Test\)\@!.scala let b:fswitchlocs = 'reg:+/src/main/scala+/src/test/scala/+' | let b:fswitchfnames='/$/Test/'

" Matches scala files that do end with Test.scala
au BufEnter *Test.scala let b:fswitchlocs = 'reg:+/test/+/app/+' | let b:fswitchfnames='/Test$//'
" au BufEnter *Test.scala let b:fswitchlocs = 'reg:+/src/test/scala+/src/main/scala/+' | let b:fswitchfnames='/Test$//'

let b:fswitchlocs = 'reg:/app/test/'
filetype plugin on
set runtimepath+=~/.vim/xpt-personal
let Grep_Default_Filelist = './**/*.scala'
nnoremap <silent> ,g :Grep<CR>

" Unbind the cursor keys in insert, normal and visual modes.
" for prefix in ['i', 'n', 'v']
"  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
"    exe prefix . "noremap " . key . " <Nop>"
"  endfor
" endfor
let g:formatprg_scala = "scalariform"
let g:formatprg_args_scala = "--stdin --stdout"
noremap <F3> :Autoformat<CR><CR>

set cursorline

" Highlight where we go over 80 columns
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

highlight WhiteOnRed ctermbg=red guibg=darkred

    " This rewires n and N to do the highlighing...
    nnoremap <silent> n   n:call HLNext(0.4)<cr>
    nnoremap <silent> N   N:call HLNext(0.4)<cr>
    "
    " OR ELSE just highlight the match in red...
    function! HLNext (blinktime)
        let [bufnum, lnum, col, off] = getpos('.')
        let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
        let target_pat = '\c\%#'.@/
        let ring = matchadd('WhiteOnRed', target_pat, 101)
        redraw
        exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
        call matchdelete(ring)
        redraw
    endfunction

    exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
    set list

" This is a bit twitchy, so use at your own risk
"    nnoremap  ;  :
"    nnoremap  :  ;

    vmap  <expr>  <LEFT>   DVB_Drag('left')
    vmap  <expr>  <RIGHT>  DVB_Drag('right')
    vmap  <expr>  <DOWN>   DVB_Drag('down')
    vmap  <expr>  <UP>     DVB_Drag('up')
    vmap  <expr>  D        DVB_Duplicate()

    nnoremap    v   <C-V>
    nnoremap <C-V>     v

    vnoremap    v   <C-V>
    vnoremap <C-V>     v

set ff=unix

" Commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
filetype plugin on
set omnifunc=syntaxcomplete#Complete


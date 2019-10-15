"--------- IMPORTS

set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/vim-airline
set runtimepath^=~/.vim/bundle/nerdtree
set runtimepath^=~/.vim/bundle/vim-go
set runtimepath^=~/.vim/bundle/vim-code-dark


execute pathogen#infect()
syntax on
filetype plugin indent on

colorscheme codedark
let g:airline_theme = 'codedark'

"--------- DEFAUTLS SET

set tabstop=4
set shiftwidth=4
set expandtab
syntax on
filetype plugin indent on
set number
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%79v', 100)
set hlsearch 
"higlight search :set noh unhigliht

set shell=/bin/bash


"--------- Key Mappings

nmap s<CR> O<Esc>
nmap <CR> o<Esc>
nmap <silent> <F2> :lchdir %:p:h<CR>:pwd<CR>
nmap <leader>l :set list!<CR> 
nmap ss i<space><esc>
nmap a<CR> i<CR><esc>

" comment like in pycharm
vnoremap <silent> # :s/^/#/<cr>:noh<cr>
vnoremap <silent> -# :s/^#//<cr>:noh<cr>
vnoremap > >gv
vnoremap < <gv

"nmap <Leader>o o<Esc>
"nmap <Leader>O O<Esc>

" ie moving between split panes
map <silent>,h <C-w>h
map <silent>,j <C-w>j
map <silent>,k <C-w>k
map <silent>,l <C-w>l

nmap <space><space> :noh<cr> 
nmap <silent>sh :sh<cr>
map <F6> :NERDTreeToggle<CR>

" TABS
nmap <leader>t :tabedit<cr> 

"--------- vim-workspace

nnoremap <leader>s :ToggleWorkspace<CR>

"--------- Wrapping Text
":set nowrap -> Disable text breaking
":set linebreak -> Break text by space
":set brake -> Break text at exactly the width of the window

vmap <C-j> gj
vmap <C-k> gk
vmap <C-4> g$
vmap <C-6> g^
vmap <C-0> g^
nmap <C-j> gj
nmap <C-k> gk
nmap <C-4> g$
nmap <C-6> g^
nmap <C-0> g^

"--------- Copy/Paste

vnoremap \y y:call system("pbcopy", getreg("\""))<CR>
nnoremap \p :call setreg("\"", system("pbpaste"))<CR>p

noremap YY "+y<CR>
noremap P "+gP<CR>
noremap XX "+x<CR>
"--------- CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']

"--------- Ctags
nnoremap ,. g<C-]>
nnoremap m, <C-t>
"--------- Fugitive.vim (GIT)

map <silent>gb :Gblame<CR>

"--------- Python settings
filetype plugin indent on
au FileType py set autoindent
au FileType py set smartindent
au FileType py set textwidth=79 " PEP-8 Friendly

"--------- NERDTree Settings
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$', '__pycache__']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1

"autocmd VimEnter * NERDTree | wincmd p
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"autocmd VimEnter */workspace/* NERDTree| wincmd p
"au VimEnter NERD_tree_1 enew | execute 'NERDTree '.argv()[0]
" autocmd BufWinEnter * NERDTreeMirror
"----------- Golang settings
autocmd FileType go nmap <F9> :GoRun!<CR>

"---------- COMMANDS

command! PrettyXML call DoPrettyXML()
command! GoBB call GoB()

"---------- MY FUNCTIONS

function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction


function GoB()
    :GoFmt
    :GoImport
endfunction

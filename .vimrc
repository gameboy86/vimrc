"--------- IMPORTS
language en_US.UTF-8

set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/vim-airline
set runtimepath^=~/.vim/bundle/nerdtree
set runtimepath^=~/.vim/bundle/vim-go
set runtimepath^=~/.vim/bundle/vim-code-dark
set runtimepath^=~/.vim/bundele/jedi-vim
set runtimepath^=~/.vim/bundle/syntatic
set runtimepath^=~/.vim/bundle/fugitive
set runtimepath^=~/.vim/bundle/vim-virtualenv
set runtimepath^=~/.vim/bundle/vim-gitgutter
"--------- DEFAUTLS SET
"
execute pathogen#infect()
syntax on
filetype plugin indent on

set ttyfast
set showmode
set showcmd
set title
set number
set hidden
set hidden
set ffs=unix,dos,mac
set path=$PWD/**
set nobackup
set nowritebackup
set nowb
set noswapfile
set undolevels=1000

set wildignore+=*.pyc,*.pyo,*/__pycache__/*
set wildignore+=*.swp,~*
set wildignore+=*.zip,*.tar

set tabstop=4
set shiftwidth=4
set expandtab

set list
set listchars=tab:→\ ,trail:·,nbsp:·

set colorcolumn=80

autocmd Filetype yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype css setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype scss setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype json setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType make setlocal noexpandtab

highlight ColorColumn ctermbg=magenta
colorscheme codedark


"--------- Python settings
filetype plugin indent on
au FileType py set autoindent
au FileType py set smartindent
au FileType py set textwidth=79 " PEP-8 Friendly
" autocmd BufWritePost *.py call flake8#Flake8()

"--------- Key Mappings
inoremap jk <Esc>

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

nmap <silent> <F2> :lchdir %:p:h<CR>:pwd<CR>
nmap <leader>l :set list!<CR> 
nmap oo o<Esc>
nmap OO O<Esc>
nmap ss i<space><esc>
nmap a<CR> i<CR><esc>

vnoremap <C-c> :w !pbcopy<CR><CR>
noremap <C-v> :r !pbpaste<CR><CR>


map <silent>,h <C-w>h
map <silent>,j <C-w>j
map <silent>,k <C-w>k
map <silent>,l <C-w>l

nmap <space><space> :noh<cr> 

" move lines

noremap <C-j> :m .+1<CR>==
noremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" au BufNewFile,BufRead *.py 
set foldmethod=indent
nnoremap <space> za
au BufRead * normal zR
" -------gitguter
highlight! link SignColumn LineNr


" -------syntatic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_aggregate_errors = 1

"-------- NERDTree
map <F6> :NERDTreeToggle<CR>

"-------- jedi-vim
autocmd FileType python setlocal completeopt-=preview
let g:jedi#popup_select_first = 0
let g:jedi#popup_on_dot = 0
let g:jedi#use_splits_not_buffers = "left"
let g:jedi#use_tabs_not_buffers = 1

"-------- airline
let g:airline_theme = 'codedark'

" TABS
nmap <leader>t :tabedit<cr> 

"--------- vim-workspace

nnoremap <leader>s :ToggleWorkspace<CR>

"--------- CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']

"--------- Fugitive.vim (GIT)
" map <silent>gb :Gblame<CR>


"--------- NERDTree Settings
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$', '__pycache__']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"----------- Golang settings
autocmd FileType go nmap <F9> :GoRun!<CR>

fu! SaveSession()
    execute 'mksession! ' . getcwd() . '/.session.vim'
endfunction

fu! RestoreSession()
if filereadable(getcwd() . '/.session.vim')
    execute 'so ' . getcwd() . '/.session.vim'
    if bufexists(1)
        for l in range(1, bufnr('$'))
            if bufwinnr(l) == -1
                exec 'sbuffer ' . l
            endif
        endfor
    endif
endif
endfunction

autocmd VimLeave * NERDTreeClose
autocmd VimLeave * call SaveSession()

" autocmd VimEnter * nested call RestoreSession()
autocmd VimEnter * NERDTree


set splitbelow
set splitright

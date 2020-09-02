"--------- IMPORTS
language en_US.UTF-8

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'dense-analysis/ale'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-commentary'
Plugin 'dyng/ctrlsf.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'davidhalter/jedi-vim'
Plugin 'preservim/nerdtree'
Plugin 'fatih/vim-go'
Plugin 'vim-syntastic/syntastic'
Plugin 'tomasiser/vim-code-dark'
Plugin 'airblade/vim-gitgutter'
Plugin 'yuezk/vim-js'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'

call vundle#end()
filetype plugin indent on

syntax on

set ttyfast
set showmode
set showcmd
set title
set number
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
set softtabstop=4
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
vnoremap jk <Esc>

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

inoremap <UP> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" noremap <A-h> <Left>
" noremap <A-j> <Down>
" noremap <A-k> <Up>
" noremap <A-l> <Right>

" inoremap <C-h> <Left>
" inoremap <C-j> <Down>
" inoremap <C-k> <Up>
" inoremap <C-l> <Right>
" cnoremap <C-h> <Left>
" cnoremap <C-j> <Down>
" cnoremap <C-k> <Up>
" cnoremap <C-l> <Right>
let g:deoplete#complete_method = "omnifunc"
nmap <silent> <F2> :lchdir %:p:h<CR>:pwd<CR>
let g:mundo_right = 1

nnoremap <F5> :MundoToggle<CR>
nmap <leader>l :set list!<CR> 
nmap oo o<Esc>
nmap OO O<Esc>
nmap ss i<space><esc>
nmap sa i<space>
nmap a<CR> i<CR><esc>
" vnoremap <C-c> :w !pbcopy<CR><CR>
" noremap <C-v> :r !pbpaste<CR><CR>


map <silent>,h <C-w>h
map <silent>,j <C-w>j
map <silent>,k <C-w>k
map <silent>,l <C-w>l
nnoremap H gT
nnoremap L gt
nmap <space><space> :noh<cr> 
set visualbell
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
au * normal zR
set foldlevel=99
" au BufNewFile,BufRead * normal zR
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
let NERDTreeShowHidden=1
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
map <silent>gb :Gblame<CR>


"--------- NERDTree Settings
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$', '__pycache__']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"----------- Golang settings
" autocmd FileType go nmap <F9> :GoRun!<CR>

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" ---------- CtrlSF settings
let g:ctrlsf_default_view_mode = 'compact'
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>


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
" autocmd VimLeave * call SaveSession()

" autocmd VimEnter * nested call RestoreSession()
" autocmd VimEnter * NERDTree
nmap     nt :NERDTreeToggle<CR>

set splitbelow
set splitright

" add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab


" vim-go
let g:go_auto_sameids = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_fmt_experimental = 1
let g:go_metalinter_autosave=1
let g:go_metalinter_autosave_enabled=['golint', 'govet']

""" 1. UI {{{
syntax enable
filetype plugin indent on
set number
set relativenumber
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
set list
set encoding=UTF-8
set updatetime=100

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab
" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2
" Linebreak on 500 characters
set lbr
set tw=500
" Auto indent
set ai 
" Smart indent
set si 
" Wrap lines
set wrap 
" Hightlight current line 
set cursorline
" Set auto change dir with nerdtree
set autochdir
" Disable signcolumn in nerdtree
autocmd FileType nerdtree setlocal signcolumn=no
" Set background is dark
set background=dark
" Enable syntax hightlight
syntax on
""" }}} End UI

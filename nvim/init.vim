call plug#begin(stdpath('data') . '/plugged')

Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle'  }

" If you don't have nodejs and yarn
" use pre build, add 'vim-plug' to the filetype list so vim-plug can update this plugin
" see: https://github.com/iamcco/markdown-preview.nvim/issues/50
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown']}

" Vim DevIcons 
Plug 'ryanoasis/vim-devicons'

" Vim Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" VIM Indent line: https://github.com/yggdroot/indentline
Plug 'Yggdroot/indentLine'

" VIM Gitgutter
Plug 'airblade/vim-gitgutter'	

" Emmet vim
Plug 'mattn/emmet-vim'

" VIM Surround
Plug 'tpope/vim-surround'

" Syntastic
Plug 'vim-syntastic/syntastic'

" Vim Prettier
Plug 'prettier/vim-prettier', { 'do': 'npm install' } " Or npm install, if you prefer npm

" Initialize plugin system
call plug#end()

"===================================================================
"== CONFIGURATION ==================================================
"===================================================================
" Leader Key
" 1. UI
" 2. VimDevIcons
" 3. Vim Airline
" 4. NERDTree Config
" 5. Vim Ident Line
"===================================================================

let mapleader = ","

""" 1. UI {{{
syntax enable
filetype plugin indent on
set number
set relativenumber
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
set list
set encoding=UTF-8

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

""" 2. VimDevIcons {{{
" loading the plugin
let g:webdevicons_enable = 1
""" }}} End VimDevIcons

""" 3. Vim Airline {{{
" adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 0
" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1
" automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'default'
""" }}} End Vim Airline

""" 4. NERDTree Config {{{
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif
" Start NERDTree when Vim starts with a directory argument.
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
" How can I close Vim or a tab automatically when NERDTree is the last window?
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" How can I prevent other buffers replacing NERDTree in its window?
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" Can I have the same NERDTree on every tab automatically?
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
let g:NERDTreeDirArrowExpandable = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'
" adding the flags to NERDTree
let g:webdevicons_enable_nerdtree = 1
""" }}} End NERDTree Config

""" 5. Vim Indent Line {{{
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 1
let g:indentLine_bgcolor_gui = 0
let g:indentLine_setConceal = 0
let g:indentLine_noConcealCursor=1
""" }}} End Vim Indent Line

""" 6. Emmet VIM {{{
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='<C-y>'
autocmd FileType html,css EmmetInstall
""" }}} End Emmet VIM

""" 7. Syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
""" }}} End Syntastic


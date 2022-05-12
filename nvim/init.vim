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

Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'mhinz/vim-signify'

" Emmet vim
Plug 'mattn/emmet-vim'

" VIM Surround
Plug 'tpope/vim-surround'

" Syntastic
Plug 'vim-syntastic/syntastic'

" Vim Prettier
Plug 'prettier/vim-prettier', { 'do': 'npm install' } " Or npm install, if you prefer npm

" Vim ddc
Plug 'Shougo/ddc.vim'
Plug 'vim-denops/denops.vim'

" Install your sources
Plug 'Shougo/ddc-around'

" Install your filters
Plug 'Shougo/ddc-matcher_head'
Plug 'Shougo/ddc-sorter_rank'

Plug 'Shougo/pum.vim'

" VIM 
Plug 'Raimondi/delimitMate'

" Initialize plugin system
call plug#end()

" Load config
for f in glob(stdpath('config') . '/configs/*.vim', 0, 1)
  execute 'source' f
endfor

" Load plugin
for f in glob(stdpath('config') . '/plugins/*.vim', 0, 1)
  execute 'source' f
endfor








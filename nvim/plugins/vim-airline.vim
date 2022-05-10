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
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#branch#enabled = 1
" Check airline_symbols does not exist then remove airline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
""" }}} End Vim Airline

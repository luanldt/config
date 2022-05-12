""" 3. Vim Airline {{{
" adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 0
" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1
" automatically displays all buffers when there's only one tab open.
let g:airline_powerline_fonts = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#branch#enabled = 1

" Tabline
let g:airline#extensions#tabline#enabled = 1           " enable airline tabline                                                           
let g:airline#extensions#tabline#show_close_button = 0 " remove 'X' at the end of the tabline                                            
let g:airline#extensions#tabline#tabs_label = ''       " can put text here like BUFFERS to denote buffers (I clear it so nothing is shown)
let g:airline#extensions#tabline#buffers_label = ''    " can put text here like TABS to denote tabs (I clear it so nothing is shown)      
let g:airline#extensions#tabline#fnamemod = ':t'       " disable file paths in the tab                                                    
let g:airline#extensions#tabline#show_tab_count = 0    " dont show tab numbers on the right                                                           
let g:airline#extensions#tabline#show_buffers = 1      " dont show buffers in the tabline                                                 
let g:airline#extensions#tabline#tab_min_count = 1     " minimum of 2 tabs needed to display the tabline                                  
let g:airline#extensions#tabline#show_splits = 0       " disables the buffer name that displays on the right of the tabline               
let g:airline#extensions#tabline#show_tab_nr = 1       " disable tab numbers                                                              
let g:airline#extensions#tabline#show_tab_type = 0     " disables the weird ornage arrow on the tabline
let g:airline#extensions#tabline#buffer_nr_format = '%s: '
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#keymap_ignored_filetypes =
      \ ['vimfiler', 'nerdtree']

" Check airline_symbols does not exist then remove airline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
""" }}} End Vim Airline

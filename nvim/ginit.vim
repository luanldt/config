let s:fontsize = 9
let s:fontname = "Consolas"

if exists('g:GuiLoaded')
  GuiTabline 0
  GuiPopupmenu 0
  GuiLinespace 1.3
  :execute "GuiFont! ". s:fontname .":h" . s:fontsize
endif

function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize + a:amount
  :execute "GuiFont! ". s:fontname .":h" . s:fontsize
endfunction

" :call AdjustFontSize(-1)

" In normal mode, keep Ctrl + ScrollUp increase the font
noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
" In insert mode, keep Ctrl + ScrollUp increase the font
inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>
inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>

" In normal mode, pressing numpad's+ increases the font
noremap <kPlus> :call AdjustFontSize(1)<CR>
noremap <kMinus> :call AdjustFontSize(-1)<CR>

" In insert mode, pressing ctrl + numpad's+ increases the font
inoremap <C-kPlus> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-kMinus> <Esc>:call AdjustFontSize(-1)<CR>a

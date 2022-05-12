set completeopt+=noinsert
set shortmess+=c

call ddc#custom#patch_global({
      \ 'keywordPattern': '[a-zA-Z_]\w*',
      \ 'completionMode': 'popupmenu',
      \ 'completionMenu': 'pum.vim',
      \ 'smartCase': v:true
      \ })


" Use around source.
call ddc#custom#patch_global('sources', ['around'])

" Change source options
call ddc#custom#patch_global('sourceOptions', {
      \ '_': {'matchers': ['matcher_head']},
      \ 'around': {'mark': 'A'},
      \ })
call ddc#custom#patch_global('sourceParams', {
      \ 'around': {'maxSize': 500},
      \ })


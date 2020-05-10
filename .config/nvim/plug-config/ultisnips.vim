nnoremap <C-E> :UltiSnipsEdit<CR>
let g:UltiSnipsExpandTrigger="<c-c>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" Reload snippet configuration files
nnoremap <leader>ur :call UltiSnips#RefreshSnippets()<CR>

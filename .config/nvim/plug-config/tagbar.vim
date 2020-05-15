nnoremap <silent><c-t> :TagbarToggle<CR>
let g:tagbar_width=25

" Auto open tagbar on certain fts {{{
"func! ManageTag()
	"if (&ft == 'cpp' || &ft == 'c' || &ft == 'h' || &ft == 'hpp' || &ft == 'tagbar')
		"TagbarOpen
	"else
		"TagbarClose
	"endif
"endfunction

"autocmd BufEnter * :call ManageTag()

"}}}

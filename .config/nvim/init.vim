call plug#begin(stdpath('data') . '/plugged')
Plug 'preservim/nerdcommenter' 
Plug 'preservim/nerdtree' 
Plug 'chriskempson/base16-vim'
Plug 'chrisbra/Colorizer'
Plug 'kien/ctrlp.vim'
Plug 'mbbill/undotree'
call plug#end()

let mapleader=" "

let g:python_host_prog="/bin/python2"
let g:python3_host_prog="/bin/python3"

set autoread
" Correct autoread
au FocusGained * :checktime

set termguicolors
set aw
set undofile
set backup
set noswapfile
set backupdir=~/tmp
set undodir=~/tmp
set ic sc
set number 
set smarttab smartindent
set cindent
set ts=4 sts=4 sw=4
set noexpandtab
set foldmethod=marker
set nowrap
set is
set clipboard=unnamedplus
set mouse=a

"colorscheme base16-default-dark
color simple-dark

" restore place in file from previous session
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

map! jj <ESC>
xnoremap p "_dP

inoremap mm m_

"nnoremap <silent> <C-K> :Ex<CR>
nnoremap <c-f> :NERDTreeToggle<CR>

nnoremap <S-j> 7jzz
nnoremap <S-k> 7kzz
nnoremap <S-l> 7zl
nnoremap <S-h> 7zh
nnoremap <S-w> 3w
nnoremap <S-b> 3b

nnoremap n nzz
nnoremap N Nzz
nnoremap <Backspace> O<Esc>
nnoremap <Enter> o<Esc>

vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-l> >gv
vnoremap <C-h> <gv

vnoremap <S-j> 7j
vnoremap <S-k> 7k
vnoremap <S-l> 7zl
vnoremap <S-h> 7zh

inoremap <C-B> {}<Left>
inoremap <C-S> []<Left>

" Command-line like reverse-search
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>

nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2 + 1)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3 + 1)<CR>
nnoremap <silent> <M-+> :exe "vert resize " . (winwidth(0) * 3/2 + 1)<CR>
nnoremap <silent> <M--> :exe "vert resize " . (winwidth(0) * 2/3 + 1)<CR>

nnoremap <C-U> :UndotreeToggle<cr>

nnoremap <leader>ve :sp ~/.config/nvim/init.vim<CR><C-W>_
nnoremap <silent> <leader>vr :source ~/.config/nvim/init.vim<CR>:filetype detect<CR>:exe ":echo 'init.vim loaded successfully'"<CR>

" For local replace
nnoremap <leader>r *[{V%::s///g<left><left>

" For global replace
nnoremap <leader>R :%s/\<<C-R><C-W>\>//g<left><left>

au BufNewFile,BufRead *.zig set ft=cpp

function! FormatFile()
	let l:formatdiff = 1
	pyf /usr/share/clang/clang-format.py
endfunction

autocmd BufWritePre *.c,*.h,*.cc,*.cpp call FormatFile()

" automatic header {{{

function! PutHeader()
	so ~/.config/nvim/c_header.txt
	exe "g/@file.*/s//@file " .expand("%")
	exe "g/@date.*/s//@date " .strftime("%d-%m-%Y")
	exe "g/Copyright.*/s//Copyright " .strftime("%Y")
	execute "normal ma"
	exe "g/@modified.*/s/@modified.*/@modified " .strftime("%c")
	execute "normal `a"
endfunction

function! PutBrief()
	so ~/.config/nvim/c_brief.txt
endfunction

function! PutBriefReturn()
	so ~/.config/nvim/c_brief_return.txt
endfunction

nnoremap <leader>h :call PutHeader()<CR>
nnoremap <leader>bb :call PutBrief()<CR>
nnoremap <leader>br :call PutBriefReturn()<CR>

autocmd bufnewfile *.c,*.h,*.cc,*.cpp so ~/.config/nvim/c_header.txt
autocmd bufnewfile *.c,*.h,*.cc,*.cpp exe "g/@file.*/s//@file " .expand("%")
autocmd bufnewfile *.c,*.h,*.cc,*.cpp exe "g/@date.*/s//@date " .strftime("%d-%m-%Y")
autocmd bufnewfile *.c,*.h,*.cc,*.cpp exe "g/Copyright.*/s//Copyright " .strftime("%Y")
autocmd Bufwritepre,filewritepre *.c,*.h,*.cc,*.cpp execute "normal ma"
autocmd Bufwritepre,filewritepre *.c,*.h,*.cc,*.cpp  exe "g/@modified.*/s/@modified.*/@modified " .strftime("%c")
autocmd bufwritepost,filewritepost *.c,*.h,*.cc,*.cpp  execute "normal `a"
" }}}

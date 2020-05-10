" Setup plugins
let mapleader=" "

source ~/.config/nvim/plugins.vim

source ~/.config/nvim/plug-config/code-fmt.vim

source ~/.config/nvim/plug-config/lightline.vim

source ~/.config/nvim/plug-config/coc.vim

source ~/.config/nvim/plug-config/syntastic.vim

source ~/.config/nvim/plug-config/tagbar.vim

source ~/.config/nvim/plug-config/ultisnips.vim

source ~/.config/nvim/plug-config/undotree.vim


set number
set hidden
set mouse=a
set smarttab
set smartindent
set smartcase
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set shell=/usr/bin/bash
set foldmethod=marker
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set clipboard=unnamedplus
set shortmess+=c

colorscheme gruvbox

" create scratch book
command! SB vnew | setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile

" Disable automatic comment on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" restore place in file from previous session
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

map! jj <ESC>

" Tab completion
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Navigate tabs
nnoremap <silent> <Tab> :tabn<CR>
nnoremap <silent> <S-Tab> :tabp<CR>
" Navigate buffers
nnoremap <silent> <C-L> :bnext<CR>
nnoremap <silent> <C-H> :bprev<CR>

nnoremap <silent> <M-h> :wincmd h<CR>
nnoremap <silent> <M-j> :wincmd j<CR>
nnoremap <silent> <M-k> :wincmd k<CR>
nnoremap <silent> <M-l> :wincmd l<CR>

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
nnoremap <Space><Space> a<Space><Esc>

vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-l> >gv
vnoremap <C-h> <gv

vnoremap <S-j> 7j
vnoremap <S-k> 7k
vnoremap <S-l> w
vnoremap <S-h> b

inoremap <C-B> {}<Left>
inoremap <C-S> []<Left>

" Command-line like reverse-search
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>

" Often utilize vertical splits
cnoreabbrev v vert

nnoremap <silent> + :exe "resize " . (winheight(0) * 6/5 + 1)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 5/6 + 1)<CR>
nnoremap <silent> <M-+> :exe "vert resize " . (winwidth(0) * 6/5 + 1)<CR>
nnoremap <silent> <M--> :exe "vert resize " . (winwidth(0) * 5/6 + 1)<CR>

nnoremap <leader>vi :e ~/.config/nvim/init.vim<CR><C-W>_
nnoremap <silent> <leader>VI :source ~/.config/nvim/init.vim<CR>:filetype detect<CR>:exe ":echo 'init.vim loaded successfully'"<CR>

" Make the directory for which the current file should be in
nnoremap <leader>m :!mkdir -p %:h<CR>

let mapleader=" "

source ~/.config/nvim/plugins.vim

" auto shit
set autowrite

" Automatically re-read file if a change was detected outside of vim
set autoread

" Change vertical split character to be a space (essentially hide it)
set fillchars=vert:▏

" Set preview window to appear at bottom
set splitbelow

" Set floating window to be slightly transparent
set winbl=10

" Set backups
set undofile
set undolevels=3000
set undoreload=10000
set backup
set noswapfile
set backupdir=~/nvim/backup/
set undodir=~/nvim/undo/

" === Search === "
" ignore case when searching
set ignorecase

" if the search string has an upper case letter in it, the search will be case sensitive
set smartcase

set termguicolors
set cursorline
set number relativenumber
set noshowcmd
set noshowmode
set noruler
set cmdheight=1
set hidden
set mouse=a
set smarttab
set smartindent
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set shell=/usr/bin/bash
set foldmethod=marker
set nowrap
set incsearch
set clipboard=unnamedplus
set shortmess+=c
set shortmess-=F
set updatetime=300
" treat dash separated words as a word object
set iskeyword+=-
" display hidden characters
set listchars=tab:▶\ ,eol:⤶

source ~/.config/nvim/plug-config/code-fmt.vim

source ~/.config/nvim/plug-config/airline.vim

source ~/.config/nvim/plug-config/coc.vim

source ~/.config/nvim/plug-config/tagbar.vim

source ~/.config/nvim/plug-config/ultisnips.vim

source ~/.config/nvim/plug-config/undotree.vim

source ~/.config/nvim/plug-config/rainbow.vim

source ~/.config/nvim/plug-config/colorizer.vim

source ~/.config/nvim/plug-config/sneak.vim

source ~/.config/nvim/plug-config/whitespace.vim

" Editor theme
set background=dark
try
  colorscheme OceanicNext
catch
	echo 'Oceanic colorscheme not installed. I should work after running :PlugInstall'
endtry

" create scratch book
command! SB vnew | setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile

" Disable automatic comment on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" restore place in file from previous session
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

map! jj <ESC>

nnoremap <leader><leader> :nohlsearch<cr>
nnoremap <silent> <leader> :Ex<cr>

" Navigate tabs
nnoremap <silent> <Right> :tabn<CR>
nnoremap <silent> <Left> :tabp<CR>
nnoremap <silent> <Up> :tabnew<CR>
" Navigate buffers
nnoremap <silent> <C-L> :bnext<CR>
nnoremap <silent> <C-H> :bprev<CR>

" Create and close buffers
nnoremap <silent> <C-N> :enew<CR>
nnoremap <silent> <C-X> :bd<CR>

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

vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-l> >gv
vnoremap <C-h> <gv
vnoremap <leader>s :'<,'>!sort -f<cr>

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

nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2 + 1)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3 + 1)<CR>
nnoremap <silent> <M-+> :exe "vert resize " . (winwidth(0) * 3/2 + 1)<CR>
nnoremap <silent> <M--> :exe "vert resize " . (winwidth(0) * 2/3 + 1)<CR>

nnoremap <leader>vi :e ~/.config/nvim/init.vim<CR><C-W>_
nnoremap <silent> <leader>VI :source ~/.config/nvim/init.vim<CR>:filetype detect<CR>:exe ":echo 'init.vim loaded successfully'"<CR>

" Make the directory for which the current file should be in
nnoremap <leader>m :!mkdir -p %:h<CR>

" Change dir to current file
nnoremap <leader>cd :cd %:p:h<CR>

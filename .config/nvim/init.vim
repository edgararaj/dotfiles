set nocompatible
filetype plugin indent on
syntax on

call plug#begin()
Plug 'lilydjwg/colorizer'
Plug 'vifm/vifm.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'AndrewRadev/discotheque.vim'
Plug 'itchyny/lightline.vim'
Plug 'sainnhe/edge'
call plug#end()

let mapleader=" "

set mouse=a

set undofile
set directory=~/nvimtmp
set undodir=~/nvimtmp
set backupdir=~/nvimtmp

set hlsearch
set incsearch
set ignorecase
set infercase
set smartcase

set tabstop=4
set shiftwidth=4
set noexpandtab
set softtabstop=4

set nowrap

" Theme
set termguicolors
set bg=dark
let g:edge_style = 'neon'
let g:edge_disable_italic_comment=1
let g:lightline = {'colorscheme': 'edge'}
colorscheme edge

" Vifm
nnoremap <leader>vv :Vifm<CR>
nnoremap <leader>vs :VsplitVifm<CR>
nnoremap <leader>sp :SplitVifm<CR>

" init.vim handling
nnoremap <leader>vi :sp ~/.config/nvim/init.vim<CR><C-W>_
nnoremap <silent> <leader>VI :source ~/.config/nvim/init.vim<CR>:filetype detect<CR>:exe ":echo 'init.vim loaded successfully'"<CR>

noremap + 2<C-W>+
noremap - 2<C-W>-
noremap _ 5<C-W>-
noremap * 5<C-W>+

noremap <A-+> 4<C-W>>
noremap <A--> 4<C-W><

noremap! <C-B> {}<Left>
noremap! <C-S> []<Left>

noremap n nzz
noremap N Nzz

noremap! jj <Esc>

nnoremap <S-j> 7jzz
nnoremap <S-k> 7kzz
nnoremap <S-l> 7zl
nnoremap <S-h> 7zh
nnoremap <S-w> 3w
nnoremap <S-b> 3b 

vnoremap <S-j> 7j
vnoremap <S-k> 7k
vnoremap <S-l> w
vnoremap <S-h> b

vnoremap < <gv
vnoremap > >gv

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
nnoremap <A-l> >>
nnoremap <A-h> <<

vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
vnoremap <A-l> >gv
vnoremap <A-h> <gv

noremap <leader>f :NERDTreeToggle<CR>

noremap <Backspace> O<Esc>
noremap <Enter> o<Esc>

noremap <leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>


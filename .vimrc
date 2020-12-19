" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
filetype plugin indent on

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

let mapleader=" "

set list
set fillchars=vert:\ 
set listchars=tab:\.\ ,trail:$

set enc=utf-8
set fenc=utf-8
set ff=unix
set termguicolors
set number

set undofile
set backup
set noswapfile
set backupdir=/tmp
set undodir=/tmp

set smarttab smartindent cindent
set noexpandtab ts=4 sts=4 sw=4

set foldmethod=marker
set nowrap
set showcmd
set showmatch
set ignorecase
set smartcase
set incsearch
set autowrite autoread
set hidden
set clipboard=unnamedplus
set mouse=a

color srcery

map j gj
map k gk
xnoremap p "_dP

nnoremap <leader><leader> <c-^>

nnoremap <silent> <c-k> :25Lex<cr>
nnoremap <c-p> :b 

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

exe "nnoremap <leader>ve :sp " . $MYVIMRC . "<CR>"
exe "nnoremap <leader>vr :source " . $MYVIMRC . "<CR>:filetype detect<CR>:exe \":echo '_vimrc loaded successfully!'\"<CR>"

" For local replace
nnoremap <leader>r *#[{V%::s///g<left><left>

" For global replace
nnoremap <leader>R :%s/\<\C<C-R><C-W>\>//g<left><left>

" Automatic header stuff
fun! PutHeader()
	exe "so ~/.vim/c_header.txt"
endfun

nnoremap <leader>h :call PutHeader()<CR>
autocmd bufnewfile *.c,*.h,*.cc,*.cpp call PutHeader()


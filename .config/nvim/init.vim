" auto plugin setup
let need_to_install_plugins = 0
if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
	silent !curl -fLo "~/.local/share/nvim/site/autoload/plug.vim" --create-dirs 
				\ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
	let need_to_install_plugins = 1
endif

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/The-NERD-tree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'dense-analysis/ale'

call plug#end()

" auto plugin install
if need_to_install_plugins == 1
    echo "Installing plugins..."
    silent! PlugInstall
    echo "Done!"
    q
endif

call glaive#Install()
Glaive codefmt plugin[mappings]

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END

let mapleader=" "

" lightline
set noshowmode
let g:lightline = { 'colorscheme': 'onedark' }

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

colorscheme onedark

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" create scratch book
command! SB vnew | setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile

" Disable automatic comment on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Open NERDTree on startup when no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" restore place in file from previous session
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

map! jj <ESC>
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

nnoremap <C-E> :UltiSnipsEdit<CR>
let g:UltiSnipsExpandTrigger="<c-c>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" Reload snippet configuration files
nnoremap <leader>s :call UltiSnips#RefreshSnippets()<CR>
" Make the directory for which the current file should be in
nnoremap <leader>m :!mkdir -p %:h<CR>

let g:NERDTreeGitStatusWithFlags = 1

map <silent><c-f> :NERDTreeToggle<CR>
map <silent><c-t> :TagbarToggle<CR>
map <silent><c-u> :UndotreeToggle<CR>:UndotreeFocus<CR>

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
map <leader>s :SyntasticCheck<CR>
map <leader>d :SyntasticReset<CR>
map <leader>e :lnext<CR>
map <leader>r :lprev<CR>

" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" auto download vim-plug
let need_to_install_plugins = 0
if empty(glob("~/.config/nvim/autoload/plug.vim"))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	let need_to_install_plugins = 1
endif

call plug#begin("~/.config/nvim/autoload/plugged")

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Add some color
Plug 'norcalli/nvim-colorizer.lua'
Plug 'luochen1990/rainbow'

" Better Syntax Support
Plug 'sheerun/vim-polyglot'

Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'justinmk/vim-sneak'
Plug 'AndrewRadev/discotheque.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'mileszs/ack.vim'
Plug 'jackguo380/vim-lsp-cxx-highlight'

call plug#end()

" auto plugin install
if need_to_install_plugins == 1
    echo "Installing plugins..."
    silent! PlugInstall
    echo "Done!"
    q
endif

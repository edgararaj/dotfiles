"" auto download vim-plug
"let need_to_install_plugins = 0
"if empty(glob("~/.config/nvim/autoload/plug.vim"))
	"silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				"\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	"let need_to_install_plugins = 1
"endif

"call plug#begin("~/.config/nvim/autoload/plugged")

"Plug 'neoclide/coc.nvim', {'branch': 'release'}

"" Add some color
"Plug 'norcalli/nvim-colorizer.lua'
"Plug 'luochen1990/rainbow'

"" Better Syntax Support
"Plug 'sheerun/vim-polyglot'

"Plug 'morhetz/gruvbox'
"Plug 'itchyny/lightline.vim'
"Plug 'ap/vim-buftabline'
"Plug 'airblade/vim-gitgutter'
"Plug 'ryanoasis/vim-devicons'
"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'scrooloose/nerdcommenter'
"Plug 'majutsushi/tagbar'
"Plug 'mbbill/undotree'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
"Plug 'google/vim-maktaba'
"Plug 'google/vim-codefmt'
"Plug 'google/vim-glaive'
"Plug 'jeffkreeftmeijer/vim-numbertoggle'
"Plug 'justinmk/vim-sneak'
"Plug 'AndrewRadev/discotheque.vim'
"Plug 'ntpeters/vim-better-whitespace'
"Plug 'mileszs/ack.vim'
"Plug 'jackguo380/vim-lsp-cxx-highlight'

"call plug#end()

"" auto plugin install
"if need_to_install_plugins == 1
    "echo "Installing plugins..."
    "silent! PlugInstall
    "echo "Done!"
    "q
"endif

" OLd -------------------------------

let need_to_install_plugins = 0

" check whether vim-plug is installed and install it if necessary
let plugpath = '~/.config/nvim/autoload/plug.vim'
if empty(glob(plugpath))
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
		call system('curl -fLo ' . plugpath . ' --create-dirs ' . plugurl)
		let need_to_install_plugins = 1
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

call plug#begin("~/.config/nvim/autoload/plugged")

" Add some color
Plug 'norcalli/nvim-colorizer.lua'
Plug 'luochen1990/rainbow'
Plug 'mhartington/oceanic-next'

" Better Syntax Support
Plug 'sheerun/vim-polyglot'

" === Git Plugins === "
" Enable git changes to be shown in sign column
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ap/vim-buftabline'
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

" Customized vim status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Auto Run PlugInstall if vim-plug was installed successfully
if need_to_install_plugins == 1
    echo "Installing plugins..."
    silent! PlugInstall
    echo "Done!"
    q
endif

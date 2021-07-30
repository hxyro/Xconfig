 "^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^Plugins-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^
 
 if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    Plug 'sheerun/vim-polyglot'
    Plug 'airblade/vim-gitgutter'
    Plug 'scrooloose/NERDTree'
    Plug 'jiangmiao/auto-pairs'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'tomasiser/vim-code-dark'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'itchyny/lightline.vim'
    Plug 'ap/vim-css-color'
    Plug 'rust-lang/rust.vim'
    Plug 'morhetz/gruvbox'
    Plug 'vifm/vifm.vim'
    Plug 'wting/rust.vim'
    Plug 'majutsushi/tagbar'
    Plug 'ervandew/supertab'
    Plug 'RishabhRD/popfix'
    Plug 'RishabhRD/nvim-finder'
call plug#end()


"^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^SETTINGS^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^

set tabstop=4 softtabstop=4
set expandtab
set shiftwidth=4
set number relativenumber
set smartindent
set nu
set path=.,/home/shubham/.config
set icon
set confirm
set backspace=indent,eol,start
set dictionary+=/home/shubham/.config/nvim/dict.txt
set autoread
set wildmenu
set autoindent
set nohlsearch
set incsearch
set hidden
set noerrorbells
set nowrap
set noswapfile
set cursorline
set nobackup
set undodir=$(xdg-user-dir)/.config/nvim/undo
set undofile
set undoreload=20000
set scrolloff=12
set signcolumn=yes
set splitbelow splitright
set background=dark
filetype plugin indent on
syntax on
"^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^Colorscheme-^-^-^-^-^-^-^-^-^^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^

"colorscheme dracula
"colorscheme 
"colorscheme 
colorscheme gruvbox


"^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^

highlight Normal guibg=none

"^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^

map <Space> :NERDTreeFind
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '<+1<CR>gv-gv




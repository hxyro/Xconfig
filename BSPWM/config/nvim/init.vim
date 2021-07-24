source $HOME/.config/nvim/vim-plug/plugins.vim


set tabstop=4 softtabstop=4
set expandtab
set shiftwidth=4
set number relativenumber
set smartindent
set nu
set nohlsearch
set incsearch
set hidden
set noerrorbells
set nowrap
set noswapfile
set nobackup
set undodir=$(xdg-user-dir)/.config/nvim/undo
set undofile
set scrolloff=12
set signcolumn=yes
set splitbelow splitright
colorscheme gruvbox
highlight Normal guibg=none

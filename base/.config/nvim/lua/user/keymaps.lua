local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap
--
-- Shorten function name
local term_opts = { silent = true }
--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
keymap("n", "<C-Left>", "<C-w>h", opts)
keymap("n", "<C-Down>", "<C-w>j", opts)
keymap("n", "<C-Up>", "<C-w>k", opts)
keymap("n", "<C-Right>", "<C-w>l", opts)

keymap("n", "<C-j>", ":resize -2<CR>", opts)
keymap("n", "<C-k>", ":resize +2<CR>", opts)
keymap("n", "<C-l>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-h>", ":vertical resize +2<CR>", opts)

keymap("n", "<leader>v", ":vsplit<CR>", opts)
keymap("n", "<leader>s", ":split<CR>", opts)
keymap("n", "<leader>e", ":Lexplore 25<CR>", opts)
keymap("n", "<leader>n", ":bnext<CR>", opts)
keymap("n", "<leader>b", ":bprevious<CR>", opts)
keymap("n", "<leader>w", ":MarkdownPreview<CR>", opts)
keymap("n", "<leader>l", ":LspInstallInfo<CR>", opts)
keymap("n", "<leader>r", ":w<CR>:RustRun<CR>", opts)
keymap("n", "<leader>1", ":colorscheme doom-one<CR>", opts)
keymap("n", "<leader>2", ":colorscheme nvcode<CR>", opts)
keymap("n", "<leader>3", ":colorscheme gruvbox<CR>", opts)
keymap("n", "<leader>4", ":colorscheme nord<CR>", opts)
keymap("n", "<leader>5", ":colorscheme onedark<CR>", opts)

-- Insert --
keymap("i", "jk", "<ESC>", opts)

-- Visual --
keymap("v", "<A-h>", "<gv", opts)
keymap("v", "<A-l>", ">gv", opts)
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

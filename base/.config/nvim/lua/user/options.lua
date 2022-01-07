local options = {
	ignorecase = true,
	smartcase = true,
	incsearch = true,
	fileencoding = "utf-8",
	tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
	expandtab = true,
	smartindent = true,
    exrc = true,
	relativenumber = true,
	number = true,
	hlsearch = false,
	cursorline = false,
    hidden = true,
    errorbells = false,
	showmode = false,
	wrap = false,
	swapfile = false,
	backup = false,
	undofile = true,
	scrolloff = 10,
	clipboard = "unnamedplus",
	completeopt = { "menuone", "noselect", "noinsert" },
	conceallevel = 2,
	pumheight = 10,
	showtabline = 4,
	splitbelow = true,
	splitright = true,
	termguicolors = true,
	timeoutlen = 200,
	updatetime = 300,
	writebackup = false,
	numberwidth = 4,
	signcolumn = "yes",
	sidescrolloff = 8,
}
vim.cmd "set undodir=$HOME/.config/nvim/undo"

vim.opt.shortmess:append "c"

vim.g.glow_binary_path = vim.env.HOME .. "/bin"
vim.g.glow_border = "rounded"
vim.g.glow_width = 120

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]

vim.opt.guicursor      = ""
vim.g.mapleader        = " "

vim.opt.number         = true
vim.opt.relativenumber = true

vim.opt.tabstop        = 4
vim.opt.softtabstop    = 4
vim.opt.shiftwidth     = 4
vim.opt.expandtab      = true
vim.opt.smartindent    = true

vim.opt.wrap           = false

vim.opt.swapfile       = false
vim.opt.backup         = false
vim.opt.undodir        = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile       = true

vim.opt.incsearch      = true
vim.opt.hlsearch       = true
vim.opt.ignorecase     = true
vim.opt.smartcase      = true

-- mouse props
vim.opt.mousehide      = true
vim.opt.mouse          = "r"

vim.opt.termguicolors  = true

vim.opt.scrolloff      = 8
vim.opt.signcolumn     = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- solarized properties
vim.g.solarized_termcolors = 256
vim.g.solarized_visibility = "high"
vim.g.solarized_contrast = "high"


-- not sure what this does
vim.opt.syntax = "enable"

-- clipboard
vim.opt.clipboard = "unnamed"
vim.opt.shell = "/opt/homebrew/bin/fish"

vim.opt.relativenumber = true

-- indentation
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.shiftround = true


vim.opt.autoread = true
vim.opt.hidden = true
vim.opt.ttyfast = true
vim.opt.showmatch = true


-- vim.opt.expandtab = true
-- vim.opt.shiftwidth = 2
-- vim.opt.softtabstop = 2
-- vim.opt.tabstop = 2
-- vim.opt.smarttab = true

-- timeout
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 0


-- Allow JSX in normal JS files
vim.g.jsx_ext_required = 0


vim.opt.wildmode = "list:full"

vim.opt.history = 500

vim.opt.wildignore = {
    "*.a",
    "*.o",
    "*.out",
    "*.bmp",
    "*.gif",
    "*.ico",
    "*.jpg",
    "*.png",
    "*.bmp",
    "*.gif",
    "*.ico",
    "*.jpg",
    "*.png",
    ".DS_Store",
    "*.git",
    "*.hg",
    "*.svn",
    "*.svg",
    "*~",
    "*.swp",
    "*.tmp",
    "*~",
    "*.class",
    "*.vimrc",
}

vim.opt.laststatus = 2
vim.opt.splitright = true

-- spell
vim.opt.spell = true
vim.opt.spelllang = { 'en_us' }

-- local treesitter = require("treesitter");
-- fold
vim.opt.foldlevel = 20
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

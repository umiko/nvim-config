vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:block-blinkon250-blinkoff250"
-- Line Numbering
vim.opt.nu = true
vim.opt.rnu = true
-- Tabwidth
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
local homedir = os.getenv("HOME")
if homedir == nil then
    vim.opt.undodir = os.getenv("HOMEPATH") .. "/.vim/undodir"
else
    vim.opt.undodir = homedir .. "/.vim/undodir"
end
vim.opt.undofile = true
-- Search options
vim.opt.hlsearch = false
vim.opt.incsearch = true
-- Colors
vim.opt.termguicolors = true
-- keep a minimum of 8 lines at the top and bottom
vim.opt.scrolloff = 8
-- show signs in the number column
vim.opt.signcolumn = "number"
vim.opt.isfname:append('@-@')
vim.opt.updatetime = 50
--vim.opt.colorcolumn = "80"

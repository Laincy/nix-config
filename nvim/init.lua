vim.cmd.colorscheme("rose-pine")

vim.diagnostic.config({ virtual_text = true })

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.inccommand = "split"

vim.opt.wrap = false

vim.opt.fillchars = { eob = " " }

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.opt.expandtab = true

vim.opt.showmode = false

vim.opt.number = true
vim.opt.relativenumber = true

require("lsp")
require("plugins")

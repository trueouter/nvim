vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd("set tabstop=2")
vim.cmd("set number")
vim.cmd("set expandtab")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set noswapfile")

vim.o.background = require("theme")

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
require("config")


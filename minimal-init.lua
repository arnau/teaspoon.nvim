local paq = require("paq")
local g = vim.g
local opt = vim.opt
local cmd = vim.api.nvim_command

g.mapleader = "\\"
g.maplocalleader = ","

paq {
  "savq/paq-nvim",

  "nvim-lualine/lualine.nvim",
  "ckipp01/stylua-nvim",
  "rktjmp/lush.nvim",
}

opt.runtimepath:append("~/kitchen/teaspoon.nvim")

opt.termguicolors = true
opt.syntax = "ON"

cmd("colorscheme teaspoon")
require("lualine").setup {
  theme = "teaspoon",
}

opt.number = true
opt.relativenumber = false
opt.cursorline = true
opt.colorcolumn = "80"
opt.scrolloff = 1
opt.errorbells = false
opt.visualbell = false
opt.signcolumn = "yes"
opt.autoindent = true
opt.smartindent = true
opt.mouse = "a"
opt.pumheight = 10

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.softtabstop = 2
opt.list = true
opt.listchars = { tab = "→ ", trail = "¬" }
opt.showbreak = "···"

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

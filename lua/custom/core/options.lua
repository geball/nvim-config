local opt = vim.opt

-- vim.g.mapleader and vim.g.maplocalleader are set in init.lua

opt.hlsearch = true
opt.incsearch = true

-- Show the cursor line
opt.cursorline = true
-- This would highlight only the number column
-- opt.cursorlineopt = "number"

-- termguicolors are needed for some color schemes
opt.termguicolors = true

-- if the color scheme offers dark mode, use it
opt.background = "dark"

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true
vim.o.autoindent = true

-- line wrapping
opt.wrap = true

-- Backspace handling
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line, or insert mode start position

-- Set tabs to always be 2 spaces
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.shiftround = true
vim.o.expandtab = true
vim.bo.softtabstop = 2

-- Add a wrap column
-- vim.o.colorcolumn = "80"

-- Start scrolling near edge of window
vim.o.scrolloff = 6
vim.o.sidescroll = 6

-- Save undo history
vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
opt.signcolumn = "yes"
opt.shada = { "'10", "<0", "s10", "h" }

-- Make dash part of a word
opt.iskeyword:append("-")

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

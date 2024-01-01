-- vim.g.mapleader and vim.g.maplocalleader are set in init.lua

vim.opt.hlsearch = true
vim.opt.incsearch = true

-- termguicolors are needed for some color schemes
vim.opt.termguicolors = true

-- if the color scheme offers dark mode, use it
vim.opt.background = "dark"

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.o.clipboard = 'unnamedplus'
vim.g.clipboard = {
  name = "myClipboard",
  copy = {
    ["+"] = { "cb", "copy" },
    ["*"] = { "cb", "copy" },
  },
  paste = {
    ["+"] = { "cb", "paste" },
    ["*"] = { "cb", "paste" },
  },
}

-- Enable break indent
vim.o.breakindent = true
vim.o.autoindent = true

-- line wrapping
vim.opt.wrap = true

-- Backspace handling
vim.opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line, or insert mode start position

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
vim.wo.signcolumn = "yes"

-- Make dash part of a word
vim.opt.iskeyword:append("-")

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

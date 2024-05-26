-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Don't let me use shift-arrows in insert mode
vim.keymap.set("i", "<S-Up>", "<Nop>", { silent = true })
vim.keymap.set("i", "<S-Down>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Toggle word wrap
vim.keymap.set("n", "<leader>w", ":set wrap!<cr>", { desc = "Toggle word wrap" })

-- Better indenting in visual mode
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- Clear highlights
-- I don't use this anymore because I have `hlsearch` set to false
-- Also, <leader>h is used by Harpoon
-- vim.keymap.set("n", "<leader>h", vim.cmd.nohl, { desc = "Remove highlight" })
vim.keymap.set("n", "<esc>", vim.cmd.nohl)

-- Move highlighted text around
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")

-- Keep cursor in place when joining lines
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor vertically centered when scrolling the buffer
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")

-- Keep search term in the vertical center of the screen when jumping with n and N
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Deleting with x and X should go to the black hole register
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "X", '"_X')

-- Paste from system clipboard
vim.keymap.set("n", "<localleader>p", '"*p', { desc = "Paste from system clipboard" })
vim.keymap.set("n", "<localleader>P", '"*P', { desc = "Paste from system clipboard" })

-- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<localleader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<localleader>Y", '"+Y', { desc = "Yank to system clipboard" })

-- Paste without losing original copied term
vim.keymap.set("x", "<localleader>p", '"_dP', { desc = "Keep original term when pasting" })

-- Make Y work like C and D
vim.keymap.set("n", "Y", "yg$")

-- Delete to void register
vim.keymap.set({ "n", "v" }, "<localleader>d", '"_d', { desc = "Delete to black hole register" })

-- Make Q a no-op
vim.keymap.set("n", "Q", "<nop>")

-- Replace term under cursor
vim.keymap.set("n", "<leader>rp", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace via Substitution" })

-- Buffer keymaps
vim.keymap.set("n", "<leader>bc", vim.cmd.bdelete, { desc = "Close buffer" })
vim.keymap.set("n", "<leader>bn", vim.cmd.bnext, { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", vim.cmd.bprevious, { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bl", "<cmd>BufferLinePick<cr>", { desc = "Pick buffer from list" })
vim.keymap.set("n", "<leader>bL", "<cmd>BufferLinePickClose<cr>", { desc = "Close buffer from list" })
vim.keymap.set("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>e", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Show buffer diagnostics" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Fold keymaps
local toggleFoldColumn = function()
  if vim.api.nvim_get_option_value("foldcolumn", {}) == "0" then
    vim.cmd("set foldcolumn=1")
  else
    vim.cmd("set foldcolumn=0")
  end
  vim.api.nvim_echo({ { "Fold column is set to " .. vim.api.nvim_get_option_value("foldcolumn", {}) } }, false, {})
end

vim.keymap.set("n", "<space>z", toggleFoldColumn, { desc = "Toggle fold" })

-- Diffview keymaps
local toggleDiffview = function()
  if vim.bo.filetype == "DiffviewFiles" then
    vim.cmd("DiffviewClose")
  else
    vim.cmd("DiffviewOpen")
  end
end
vim.keymap.set("n", "<leader>gd", toggleDiffview, { desc = "Toggle diffview" })
-- See :h wildcharm for why <C-Z> is used
vim.keymap.set("n", "<leader>gD", ":Diffview<C-Z>", { desc = "Trigger :Diffview in command line" })

-- GitHub Copilot
vim.api.nvim_set_keymap("i", "<M-y>", "copilot#Accept()", { expr = true, silent = true })
vim.cmd("let g:copilot_no_tab_map = v:true")

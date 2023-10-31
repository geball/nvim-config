local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- Prevent comments from carrying over to new lines
autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions:remove({ "r", "o" })
  end,
})

-- Open the tree when vim starts if the current buffer is a directory
autocmd("VimEnter", {
  callback = function(data)
    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1

    -- change to the directory
    if directory then
      vim.cmd.cd(data.file)
      -- open the tree
      require("nvim-tree.api").tree.open()
    end
  end,
})

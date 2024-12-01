local autocmd = vim.api.nvim_create_autocmd

-- Prevent comments from carrying over to new lines
autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions:remove({ "r", "o" })
  end,
})

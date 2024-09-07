return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    local wk = require("which-key")
    wk.add({
      { "<leader>b", group = "Buffers" },
      { "<leader>c", group = "Code" },
      { "<leader>d", group = "Debug / Diagnostics" },
      { "<leader>f", group = "Find" },
      { "<leader>g", group = "Git" },
      { "<leader>j", group = "Flash" },
      { "<leader>r", group = "Rename" },
      { "<leader>s", group = "Swap" },
      { "<leader>t", group = "TreeSJ" },
      { "<leader>x", group = "TroubleToggle" },
    })
  end,
  opts = {},
}

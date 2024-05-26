return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    local wk = require("which-key")
    wk.register({
      b = { name = "Buffers" },
      c = { name = "Code" },
      d = { name = "Debug / Diagnostics" },
      f = { name = "Find" },
      g = { name = "Git" },
      j = { name = "Flash" },
      r = { name = "Rename" },
      s = { name = "Swap" },
      t = { name = "TreeSJ" },
      x = { name = "TroubleToggle" },
    }, { prefix = "<leader>" })
  end,
  opts = {},
}

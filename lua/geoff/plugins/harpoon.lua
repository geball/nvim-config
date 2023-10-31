return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local keymap = vim.keymap
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    keymap.set("n", "<leader>a", mark.add_file, { desc = "Mark file with Harpoon" })
    keymap.set("n", "<leader>h", ui.toggle_quick_menu, { desc = "Toggle Harpoon menu" })
    keymap.set("n", "<C-7>", function()
      ui.nav_file(1)
    end, { desc = "Harpoon mark 1" })
    keymap.set("n", "<C-8>", function()
      ui.nav_file(2)
    end, { desc = "Harpoon mark 2" })
    keymap.set("n", "<C-9>", function()
      ui.nav_file(3)
    end, { desc = "Harpoon mark 3" })
    keymap.set("n", "<C-0>", function()
      ui.nav_file(4)
    end, { desc = "Harpoon mark 4" })
  end,
}

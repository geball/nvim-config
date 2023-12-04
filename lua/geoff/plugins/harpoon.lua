return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():append()
    end, { desc = "Append to Harpoon" })

    vim.keymap.set("n", "<leader>h", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Toggle Harpoon menu" })

    vim.keymap.set("n", "<leader>2", function()
      harpoon:list():select(1)
    end, { desc = "Harpoon mark 1" })
    vim.keymap.set("n", "<leader>3", function()
      harpoon:list():select(2)
    end, { desc = "Harpoon mark 2" })
    vim.keymap.set("n", "<leader>4", function()
      harpoon:list():select(3)
    end, { desc = "Harpoon mark 3" })
    vim.keymap.set("n", "<leader>5", function()
      harpoon:list():select(4)
    end, { desc = "Harpoon mark 4" })
  end,
}

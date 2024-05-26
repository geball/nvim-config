return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- change color for arrows in tree to light blue
    vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
    vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

    nvimtree.setup({
      view = {
        width = 30,
        relativenumber = false,
      },
      renderer = {
        highlight_git = true,
        indent_markers = {
          enable = true,
        },
        icons = {
          show = {
            git = true,
          },
        },
      },
      -- disable window_picker for explorer to work well with window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      live_filter = {
        prefix = "[FILTER]: ",
        always_show_folders = false,
      },
      filters = {
        custom = {
          "^node_modules$",
          "^.git$",
          "^.next$",
          "^.DS_Store$",
        },
      },
      git = {
        enable = true,
        ignore = false,
      },
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>n", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle NvimTree" })
    keymap.set("n", "<leader>fn", "<cmd>NvimTreeFindFile<cr>", { desc = "Go to file in NvimTree" })
  end,
}

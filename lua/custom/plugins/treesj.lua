return {
  "Wansmer/treesj",
  keys = {
    { "<leader>tt", "<cmd>TSJToggle<CR>", desc = "Toggle Treesitter node" },
    { "<leader>ts", "<cmd>TSJSplit<CR>", desc = "Split Treesitter node" },
    { "<leader>tj", "<cmd>TSJJoin<CR>", desc = "Join Treesitter node" },
  },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
  config = function()
    require("treesj").setup({
      use_default_keymaps = false,
      -- Don't format a node if there's a syntax error
      check_syntax_error = true,
      -- Don't create a line longer than this many characters
      max_join_length = 120,
      -- Cursor behavior:
      -- hold - cursor follows the node/place on which it was called
      -- start - cursor jumps to the first symbol of the node being formatted
      -- end - cursor jumps to the last symbol of the node being formatted
      cursor_behavior = "hold",
    })
  end,
}

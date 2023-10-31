return {
  {
    "AckslD/nvim-neoclip.lua",
    requires = {
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require("neoclip").setup({
        preview = true,
        content_spec_column = true,
      })
    end,
  },
}

return {
  -- TODO: Review https://github.com/lukas-reineke/indent-blankline.nvim for improvements
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    local ibl = require("ibl")
    ibl.setup()
  end,
}

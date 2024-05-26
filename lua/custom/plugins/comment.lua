return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    -- Good for files containing different languages (Svelte, Vue, etc.)
    -- TODO: Throws an error. Try later.
    -- "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    -- import comment plugin safely
    local comment = require("Comment")

    -- TODO: Uncomment with above.
    -- local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

    comment.setup({
      -- for commenting tsx and jsx files
      --  TODO: Uncomment with above
      -- pre_hook = ts_context_commentstring.create_pre_hook(),
    })
  end,
}

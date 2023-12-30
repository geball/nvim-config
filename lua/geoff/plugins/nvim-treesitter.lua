return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
    },
    config = function()
      local config = require("nvim-treesitter.configs")

      config.setup({
        modules = {},
        ignore_install = {},

        -- if true, autoinstall languages that aren't installed
        auto_install = false,

        highlight = {
          enable = true,
        },
        indent = { enable = true },
        -- enable autotagging (w/ nvim-ts-autotag plugin)
        autotag = {
          enable = true,
        },
        -- ensure these language parsers are installed
        ensure_installed = {
          "css",
          "dockerfile",
          "gitignore",
          "go",
          "html",
          "javascript",
          "jq",
          "json",
          "lua",
          "markdown",
          "markdown_inline",
          "query",
          "rust",
          "svelte",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
        },
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = "<C-CR>",
            node_decremental = "<BS>",
          },
        },

        -- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },
      })
    end,
  },
}

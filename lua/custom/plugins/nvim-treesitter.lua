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
          -- Disable treesitter on files larger than 200 kB
          disable = function(_, buf)
            local max_filesize = 200 * 1024 -- 200 kB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
        },
        indent = { enable = true },
        -- enable autotagging (w/ nvim-ts-autotag plugin)
        autotag = {
          enable = true,
        },
        -- ensure these language parsers are installed
        ensure_installed = {
          "c",
          "css",
          "gitignore",
          "go",
          "graphql",
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

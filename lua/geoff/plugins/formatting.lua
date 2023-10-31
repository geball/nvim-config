return {
  "stevearc/conform.nvim",
  lazy = true,
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        go = { "gofmt" },
        jq = { "jq" },
        javascript = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        javascriptreact = { { "prettierd", "prettier" } },
        typescriptreact = { { "prettierd", "prettier" } },
        svelte = { { "prettierd", "prettier" } },
        css = { { "prettierd", "prettier" } },
        html = { "prettier" },
        json = { { "prettierd", "prettier" } },
        yaml = { "prettier" },
        markdown = { "prettier" },
        lua = { "stylua" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>l", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, {
      desc = "Format code",
    })
  end,
}

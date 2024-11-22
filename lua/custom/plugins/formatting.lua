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
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
        -- typescript = { "prettierd", "prettier", stop_after_first = true },
        -- javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        -- typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        -- svelte = { "prettierd", "prettier", stop_after_first = true },
        -- css = { "prettierd", "prettier", stop_after_first = true },
        -- html = { "prettier" },
        -- json = { "prettierd", "prettier", stop_after_first = true },
        -- yaml = { "prettier" },
        -- markdown = { "prettier" },
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

return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "L3MON4D3/LuaSnip", -- Snippet engine
    "saadparwaiz1/cmp_luasnip", -- Snippet source for nvim-cmp
    "hrsh7th/cmp-buffer", -- Buffer source for nvim-cmp
    "hrsh7th/cmp-path", -- Path source for nvim-cmp
    -- "hrsh7th/cmp-cmdline", -- Cmdline completion source for nvim-cmp
    "hrsh7th/cmp-nvim-lsp", -- Adds LSP completion capabilities
    "hrsh7th/cmp-nvim-lua", -- Lua completion source for nvim-cmp
    "onsails/lspkind.nvim", -- vs-code like pictograms
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = {
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<c-y>"] = cmp.mapping(
          cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = false,
          }),
          { "i", "c" }
        ),
        ["<c-space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),

        ["<tab>"] = cmp.config.disable,
      },
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "luasnip" },
        { name = "copilot" },
        { name = "path" },
        { name = "buffer", keyword_length = 5 },
        -- Removed due to this bug: https://github.com/hrsh7th/nvim-cmp/issues/1310#issuecomment-1326712312
        -- { name = "cmdline" },
      }),
      -- configure pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
          with_text = true,
          menu = {
            buffer = "[buf]",
            nvim_lsp = "[LSP]",
            nvim_lua = "[api]",
            path = "[path]",
            luasnip = "[snip]",
          },
        }),
      },
      sorting = {
        comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.score,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
    })
  end,
}
